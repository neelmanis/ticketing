<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
require_once APPPATH.'modules/generic/controllers/Generic.php';

class Exhibitor extends Generic{
  
    function __construct() {
        parent::__construct();
        //$this->userSession();
        //$user = $this->session->userdata('user');
        $this->load->model('Mdl_exhibitor');
    }

    function index(){
      if(!Modules::run('security/isExibitor')){
        $data['title'] = "Exhibitor Login Page";
        $data['global'] = $this->global_variables;
        $this->load->view( 'web/login', $data );
      }else{
        redirect('exhibitor/dashboard','refresh');
      }
    }

    function loginAction()
    {
      $content = $this->input->post();
      $token = $this->session->userdata("token");
      //print_r($content);
      if(isset($content) && !empty($content)){
        $this->form_validation->set_rules('username','User name','trim|xss_clean|required');
        $this->form_validation->set_rules("password","Password","trim|xss_clean|required|min_length[6]|max_length[25]",
        array(
          'required' => "Password is required"
        ));

        if($this->form_validation->run($this) == FALSE){

          $errors = $this->form_validation->error_array();
          $errors = $this->form_validation->error_array();
          echo json_encode($errors); exit;

        } else {        

          $password = $content['password'];
          $username = $content['username'];
          $registration = $this->Mdl_exhibitor->retrieve("iijs_exhibitor", array("Exhibitor_Code" => $username,"Exhibitor_Password"=>$password));

          if($registration == "NA"){
            echo json_encode(array("status"=>"fail","title"=>"Login Failed","icon"=>"error","message"=>'Username And Password Does Not Exit'));exit;
          } else {
          
            //$is_valid_password = Modules::run('security/verifyPassoword',$password,$registration[0]->password);
            if($password != $registration[0]->Exhibitor_Password){
              $is_valid_password = false;
            } else {
              $is_valid_password = true;
            }
            if($is_valid_password){
              $exhibitor_session_data = array(
                'uid'=>$registration[0]->Exhibitor_Registration_ID,
                'Exhibitor_Name'=>$registration[0]->Exhibitor_Name,
                'Exhibitor_Code'=>$registration[0]->Exhibitor_Code,
                'Exhibitor_Email'=>$registration[0]->Exhibitor_Email,
                'Exhibitor_Registration_ID'=>$registration[0]->Exhibitor_Registration_ID,
                'is_superadmin'=>"no",
                'type'=>'exhibitor',
                'rights'=> "",
                "token"=>$token,
              );
              
              $this->session->set_userdata('exhibitor', $exhibitor_session_data);
              $redirect = 'exhibitor/dashboard';
              
              echo json_encode(array("status"=>"redirect","redirect"=>$redirect)); exit;
            } else {
              echo json_encode(array("status"=>"alert","title"=>"Access Denied!","icon"=>"error","message"=>'Incorrect Password.'));exit;
            }
          }
        }
            
      }else{
        redirect('/exhibitor-login','refresh');
        //echo json_encode(array("status"=>"alert","title"=>"Oops! an Error occured","icon"=>"error","message"=>"Your session has expired. Please reload & try again.")); exit;
      }
    }

    function logout(){
      $this->session->unset_userdata('exhibitor');
      redirect('/exhibitor-login','refresh');
    }
    
    function dashboard(){
      $this->exhibitorSession();
      
      $exhibitor = $this->session->userdata("exhibitor");
      $uid = $exhibitor['uid'];
      $userDetails = $this->Mdl_exhibitor->retrieve("iijs_exhibitor",array("Exhibitor_Registration_ID"=>$uid));
    
      $data['userDetails'] = $userDetails;
    
      $data['viewFile'] = "web/dashboard";
      $data['scriptFile'] = "exhibitor";
      $data['module'] = "exhibitor";
      $template = 'exhibitor';
      //print_r($data);
      echo Modules::run('template/'.$template, $data);

    }

    function helpdesk_login_dashboard(){
      $query_string = $_GET;
      if(!isset($query_string)){
        redirect('/exhibitor-login','refresh');
      }
      $Exhibitor_Code = $query_string['Exhibitor_Code'];
      $auth = $query_string['auth'];
      if($auth != 'helpdesk' && !isset($Exhibitor_Code)){
        redirect('/exhibitor-login','refresh');
      }
      //print_r($query_string);exit;

      $exhibitorDetails = $this->Mdl_exhibitor->retrieve("iijs_exhibitor",array("Exhibitor_Code"=>$Exhibitor_Code));
      if($exhibitorDetails == 'NA'){
        redirect('/exhibitor-login','refresh');
      } 
      $exhibitor_session_data = array(
        'uid'=>$exhibitorDetails[0]->Exhibitor_Registration_ID,
        'Exhibitor_Name'=>$exhibitorDetails[0]->Exhibitor_Name,
        'Exhibitor_Code'=>$exhibitorDetails[0]->Exhibitor_Code,
        'Exhibitor_Email'=>$exhibitorDetails[0]->Exhibitor_Email,
        'Exhibitor_Registration_ID'=>$exhibitorDetails[0]->Exhibitor_Registration_ID,
        'is_superadmin'=>"no",
        'type'=>'exhibitor',
        'rights'=> "",
        "token"=>'',
      );
      $this->session->set_userdata('exhibitor', $exhibitor_session_data);
      $redirect = 'exhibitor/dashboard';
      header('Location: '.$redirect);
    }

    function getAllTicketRecords()
    {
      $records = $this->Mdl_exhibitor->get_datatables("tickets");
      $data = array();
      $no = $_POST['start']; 
      $exhibitor_session = $this->session->userdata('exhibitor');
      
      foreach ($records as $val){
        $row = array();
        // $visitor = '<div class="d-flex">
        // <div class="mr-3">
        //     <img width="40" height="40" class="img-circle" src="'.base_url('images/'.$val->photo_name).'" alt="" >
        // </div>
        // <div class="text-left">
        //     <p class="mb-0">'.$val->name.'</p>
        //     <p class="">
        //         '.$val->designation.'
        //     </p>
        // </div>
        // </div>';
      
        $url = base_url().'exhibitor/update/'.$val->id;	
        $row[] = $val->unique_code;  
        $row[] = $val->exhibitor_name;
        $row[] = $val->hall_no;
        $row[] = $val->subject;
        
        if($val->status_id  == 1){
          $row[] = '<span class="badge badge-danger" style="background-color: green;">Open</span>';
        } else if($val->status_id  == 2){
          $row[] = '<span class="badge badge-danger" style="background-color: yellow;">Pending</span>';
        } else if($val->status_id  == 3){
          $row[] = '<span class="badge badge-danger" style="background-color: blue;">Resolved</span>';
        } else {
          $row[] = '<span class="badge badge-danger" >Closed</span>';
        }
        $editUrl = base_url().'exhibitor/update/'.$val->unique_code;
        $viewUrl = base_url().'exhibitor/view/'.$val->id;
        $row[] = '<a class="btn btn-circle btn-info action_edit" href="'.$viewUrl.'" title="View"><i class="fa fa-eye"></i></a>';
        $row[] = date("d-m-Y",strtotime($val->created_at));
        // if($val->status_id == 'Y'){
        //   $row[] = '<span class="badge badge-success">Active</span>';
        // }elseif($val->status == 'D'){
        //   $row[] = '<span class="badge badge-danger">Disapproved</span>';
        // }elseif($val->status == 'N'){
        //   $row[] = '<span class="badge badge-danger">Disapproved</span>';
        // }else{
        //   $row[] = '<span class="badge badge-warning">Pending</span>';
        // }

        $data[] = $row;
      }
     
      $output = array(
        "draw" => $_POST['draw'],
        "recordsTotal" => $this->Mdl_exhibitor->count_all("tickets"),
        "recordsFiltered" => $this->Mdl_exhibitor->count_filtered("tickets"),
        "data" => $data,
      );
      //echo $this->db->last_query(); exit;
      
      echo json_encode($output);
    }

    function add()
    {
      if(Modules::run('security/isExibitor')){
        $exhibitor = $this->session->userdata('exhibitor');
        $uid = $exhibitor['uid'];
        $registration = $this->Mdl_exhibitor->retrieve("iijs_exhibitor",array("Exhibitor_Registration_ID"=>$uid));
        if($registration == "NA"){
          redirect('/exhibitor-login','refresh');
        }
        $ticket_departments = $this->Mdl_exhibitor->retrieve("ticket_departments",array("status"=>'Y'));
        $data['departments'] = $ticket_departments;
        $data['scriptFile'] = 'exhibitor';
        $data['viewFile'] = 'web/add';
        $data['module'] = "exhibitor";
        $data['breadcrumb'] = "Add Ticket";
        $template = 'exhibitor';		
        echo Modules::run('template/'.$template, $data);
      }else{
        redirect('/exhibitor-login','refresh');
      } 
    }

    function view(){
      if(Modules::run('security/isExibitor')){
        $id = $this->uri->segment(3);
        if(!isset($id)){
          redirect('/exhibitor-login','refresh');
        }
        $exhibitor_data = $this->Mdl_exhibitor->retrieve("tickets",array("id"=>$id));
        if($exhibitor_data == "NA"){
          redirect('/exhibitor-login','refresh');
        }
        $comment = $this->show_tree($exhibitor_data[0]->id); 
        if($comment == 'no'){
          $data['comments'] = '';
        }else{
          $data['comments'] = $comment;
        } 
        $ticket_departments = $this->Mdl_exhibitor->retrieve("ticket_departments",array("status"=>'Y'));
        $data['exhibitor_data'] = $exhibitor_data;
        $data['departments'] = $ticket_departments;
        $data['scriptFile'] = 'exhibitor';
        $data['viewFile'] = 'web/view';
        $data['module'] = "exhibitor";
        $data['breadcrumb'] = "View Ticket";
        $template = 'exhibitor';		
        echo Modules::run('template/'.$template, $data);
      }else{
        redirect('/exhibitor-login','refresh');
      } 
    }

    function addTicketction()
    {
      $content = $this->input->post();    
      $this->form_validation->set_rules("subject","subject","trim|required|xss_clean",
      array(
        'required' => 'Subject is required.'
      ));

      // $this->form_validation->set_rules("department","department","trim|required|xss_clean",
      // array(
      //   'required' => 'Please select Department.'
      // ));

      $this->form_validation->set_rules("description","description","trim|xss_clean",
      array(
        'required' => 'Description is required.'
      ));

      if ($this->form_validation->run($this) == FALSE) {
        $errors = $this->form_validation->error_array();
        echo json_encode($errors);
        exit;
      } else {
      
        $digits = 9;	
        $uniqueIdentifier = rand(pow(10, $digits-1), pow(10, $digits)-1);
        $checkUniqueIdentifier =$this->Mdl_exhibitor->isExist("tickets", array("unique_code"=>$uniqueIdentifier));
      
        while($checkUniqueIdentifier){
            $uniqueIdentifier = rand(pow(10, $digits-1), pow(10, $digits)-1);
        } 
        //$department = $content['department'];
        if($this->session->userdata('exhibitor')){
          $exhibitor = $this->session->userdata('exhibitor');
          $registration_id = $exhibitor['uid'];
          $exhibitor_code = $exhibitor['Exhibitor_Code'];
          $exhibitor_data = $this->Mdl_exhibitor->retrieve("iijs_exhibitor", array("Exhibitor_Code" => $exhibitor_code));
          if($exhibitor_data == "NA"){
            redirect('/exhibitor-login','refresh');
          }
          $exhibitor_name = $exhibitor_data[0]->Exhibitor_Name;
          $exhibitor_hall_no = $exhibitor_data[0]->Exhibitor_HallNo;
          $exhibitor_division_no = $exhibitor_data[0]->Exhibitor_DivisionNo;
          $exhibitor_email = $exhibitor_data[0]->Exhibitor_Email;
          $exhibitor_contact_person = $exhibitor_data[0]->Exhibitor_Contact_Person;

          // $department_data = $this->Mdl_exhibitor->retrieve("ticket_departments", array("id" => $department));
          // if($department_data == "NA"){
          //   redirect('/exhibitor-login','refresh');
          // }

          $hall_manager_data = $this->Mdl_exhibitor->retrieve("admin_master", array("division_name" => $exhibitor_division_no));
          if($hall_manager_data == "NA"){
            redirect('/exhibitor-login','refresh');
          }
          $hall_manager_email = $hall_manager_data[0]->email_id;
          $hall_manager_mobile = $hall_manager_data[0]->mobile_no;

        } else {
          redirect('/exhibitor-login','refresh');
        } 
        //$base_path = "web_uploads/tickets/";
        // if(!empty($_FILES['exh_photo']['name'])){
        //     $filename = $_FILES['exh_photo']['name'];
        //     $ext = pathinfo($filename, PATHINFO_EXTENSION);
        //     $imagename_photo =  $uniqueIdentifier;
        //     $img = $this->uploadFile($imagename_photo,$base_path,"pdf|png|jpg|jpeg|doc|docx|xls|zip|ods|xlsm|xlsx|ppt|pptxs",'3000','','',"exh_photo");
        //     $imgName = $imagename_photo.'.'.$ext;
        //     if($img !== 1){
        //       echo json_encode(array("image"=>$img)); exit;
        //     }
        // } else {
        //   echo json_encode(array("image"=>"Please select Photo file to upload")); exit;
        // }

        //$photo_url = base_url().'web_uploads/tickets/'.$imgName;
        
        $data = array(
          'unique_code' => strip_tags($uniqueIdentifier),
          'exhibitor_code' => strip_tags($exhibitor_code),
          'exhibitor_name' => $exhibitor_name,
          'hall_no' => strip_tags($exhibitor_hall_no),
          //'photo_url' => $photo_url,
          'division_no' => $exhibitor_division_no,
          'subject' => strip_tags($content['subject']),
          'description' => strip_tags($content['description']),
          //'department_id' => strip_tags($department),
          'status_id' => 1,
          'created_at' => date('Y-m-d H:i:s'),
        );
        if($exhibitor_email !== ""){ 
          $mailData = array(
            "view_file" => "exhibitor_ticket_generation",
            "to" => 'rohit@kwebmaker.com',//$exhibitor_email,
            "cc" => "neelmani@kwebmaker.com",//$hall_manager_email,
            "bcc" => "",
            'company' => $exhibitor_name,
            'unique_code' => $uniqueIdentifier,
            'name' => $exhibitor_contact_person,
            //'department' => $department_data[0]->name,
            "subject" => 'New Ticket Alert',
            'description' => strip_tags($content['description'])
          );
          //$sent = Modules::run('email/mailer', $mailData);
          $sent = Modules::run('email/send_mail', $mailData);
          if(!$sent){
            echo json_encode(array("status"=>"error","message"=>"Mail Not Sent")); exit;
          }
        }
        $insert = $this->Mdl_exhibitor->insert("tickets", $data);
        if($insert > 0){
          echo json_encode(array("status"=>"success","message"=>"Ticket Succefully Created","redirect"=>'exhibitor/dashboard')); exit;
        } else {
          echo json_encode(array("status"=>"error")); exit;
        }
        
      }
    }

    function update(){
      if(Modules::run('security/isExibitor')){
        $unique_code = $this->uri->segment(3);
        if(!isset($unique_code)){
          redirect('/exhibitor-login','refresh');
        }

        $exhibitor_data = $this->Mdl_exhibitor->retrieve("tickets",array("unique_code"=>$unique_code));
        if($exhibitor_data == "NA"){
          redirect('/exhibitor-login','refresh');
        }
        $ticket_departments = $this->Mdl_exhibitor->retrieve("ticket_departments",array("status"=>'Y'));
        $data['exhibitor_data'] = $exhibitor_data;
        $data['departments'] = $ticket_departments;
        $data['scriptFile'] = 'exhibitor';
        $data['viewFile'] = 'web/update';
        $data['module'] = "exhibitor";
        $data['breadcrumb'] = "Update Ticket";
        $template = 'exhibitor';		
        echo Modules::run('template/'.$template, $data);
      }else{
        redirect('/exhibitor-login','refresh');
      } 
    }


    function updateTicket(){
      $content = $this->input->post();    
      $this->form_validation->set_rules("subject","subject","trim|required|xss_clean",
      array(
        'required' => 'Subject is required.'
      ));

      // $this->form_validation->set_rules("department","department","trim|required|xss_clean",
      // array(
      //   'required' => 'Please select Department.'
      // ));

      $this->form_validation->set_rules("description","description","trim|xss_clean",
      array(
        'required' => 'Description is required.'
      ));

      $this->form_validation->set_rules("unique_code","unique_code","trim|xss_clean",
      array(
        'required' => 'Unique Code is required.'
      ));

      if ($this->form_validation->run($this) == FALSE) {
        $errors = $this->form_validation->error_array();
        echo json_encode($errors);
        exit;
      } else {	
      
        if($this->session->userdata('exhibitor')){
          $exhibitor = $this->session->userdata('exhibitor');
          $unique_code = $content['unique_code'];
          $exhibitor_data = $this->Mdl_exhibitor->retrieve("tickets", array("unique_code" => $unique_code));
          if($exhibitor_data == "NA"){
            redirect('/exhibitor-login','refresh');
          }
          $exhibitor_code = $exhibitor_data[0]->exhibitor_code;
        } else {
          redirect('/exhibitor-login','refresh');
        }
        
        //$department = $content['department'];
        $data = array(
          'subject' => strip_tags($content['subject']),
          'description' => strip_tags($content['description']),
          //'department_id' => strip_tags($department),
          'updated_at' => date('Y-m-d H:i:s'),
        );
        $update = $this->Mdl_exhibitor->update("tickets",array("unique_code"=>$unique_code),$data);
        //$update = $this->Mdl_exhibitor->update("tickets",array("unique_code"=>$unique_code),array('exhibitor_code'=>$exhibitor_code));
        if($update > 0){
          echo json_encode(array("status"=>"success","message"=>"Ticket Succefully Created","redirect"=>'exhibitor/dashboard')); exit;
        } else {
          echo json_encode(array("status"=>"error")); exit;
        }
        
      }
    }

    function addComment(){
      $content = $this->input->post();
      $this->form_validation->set_rules('comment','Comment','trim|xss_clean|required');
      if($this->form_validation->run($this) == FALSE){
        $errors = $this->form_validation->error_array();	
        echo json_encode($errors); exit;
      } else {
        $data = array(
          'ticket_id' => $content['ticket_id'],
          'comments' => $content['comment'],
          'role' => $content['utype'],
          'user_id'=> $content['user_id'],
          'parentId'=> $content['pid'],
          'created_at' =>date('Y-m-d H:i:s')
        );
        $insert = $this->Mdl_exhibitor->insert("ticket_replies", $data);
        if($insert){
          echo json_encode(array("status"=>"success",'message'=>'comment added...','redirect'=>'exhibitor/view/'.$content['ticket_id'])); exit;
        }			
      }
    }


}