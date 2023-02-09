<?php 
 $admin = $this->session->userdata('exhibitor');
 $role = $admin['type'];
 $admin_id = $admin['uid'];
 if($role == 'exhibitor'){
    $url = base_url().'assets/admin/images/gjepc_logo_abs.png';
 }
	$activeUser = '';						
?>
<div class="row page-titles">
    <div class="col-md-5 align-self-center">
        <h4 class="text-themecolor"><?php echo $breadcrumb;?></h4>
    </div>
    <div class="col-md-7 align-self-center text-right">
        <div class="d-flex justify-content-end align-items-center">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<?php echo base_url();?>exhibitor/dashboard">Home</a></li>
                <li class="breadcrumb-item active">Update Ticket</li>
            </ol>
            <!--<button type="button" class="btn btn-info d-none d-lg-block m-l-15"><i class="fa fa-plus-circle"></i> Create New</button>-->
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title"><?php echo $breadcrumb;?></h4>
                
                <form class="form-material" id="update-ticket-form">
                    <div class="form-group  row">
                        <label for="example-text-input" class="col-sm-10 col-form-label"><strong>SUBJECT</strong></label>
                        <div class="col-sm-12">
                            <input class="form-control" type="text" name="subject" id="subject" value="<?php echo $exhibitor_data[0]->subject ?>" readonly>
                            <label for="subject" generated="true" class="error"></label>
                        </div>                        
                    </div>

                    <!-- <div class="form-group row">
                        <label for="example-search-input" class="col-sm-12 col-form-label"><strong>SELECT DEPARTMENT</strong></label>
                        <div class="col-sm-12">
                            <select class="form-control" name="department" id="department" disabled>                            
                              <option value="">SELECT DEPARTMENT</option>
                                <?php foreach($departments as $val){ ?>
                                <option value="<?php echo $val->id; ?>" <?php echo $val->id == $exhibitor_data[0]->department_id ? 'selected' : ''; ?>><?php echo strtoupper($val->name); ?></option>
                                <?php } ?>
							</select>
                            <label for="department" generated="true" class="error"></label>
                        </div>                        
                    </div> -->
           
					<div class="form-group  row">
                        <label for="example-text-input" class="col-sm-10 col-form-label"><strong>DESCRIPTION</strong></label>
                        <div class="col-sm-12">
                            <textarea name="description" class="form-control" id="description" cols="50" rows="5" readonly><?php echo $exhibitor_data[0]->description; ?></textarea>
                            <label for="description" generated="true" class="error"></label>
                        </div>                        
                    </div>

                    <div class="form-group  row hidden">
                        <div class="col-sm-12">
                        <input class="form-control" type="hidden" name="unique_code" id="unique_code" value="<?php echo $exhibitor_data[0]->unique_code ?>">
                            <label for="unique_code" generated="true" class="error"></label>
                        </div>                        
                    </div>

                    <!-- <div class="form-group row">
                        
                        <div class="col-10">
                            <input class="btn btn-success" type="submit"  name="submit" value="submit">
                            <button class="btn " type="Reset">Reset</button>
                        </div>
                    </div> -->
                    
                    
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Comments Section -->
<div class="card">
    <div class="card-body">
        <div class="form-group row">
                <label for="example-text-input" class="col-sm-12 col-form-label"><strong>SUBJECT </strong></label>
                <div class="col-sm-12">
                    <input class="form-control" type="text" name="subject" id="subject" value="<?php echo $exhibitor_data[0]->subject; ?>">
                <label for="subject" generated="true" class="error"></label>
                </div>                        
        </div>
        <div class="form-group row">
                <label for="example-text-input" class="col-sm-12 col-form-label"><strong>Ticket Summary </strong></label>
                <div class="col-sm-12">
                <textarea class="form-control" name="description" id="description"><?php echo $exhibitor_data[0]->description; ?></textarea>
                <label for="fname" generated="true" class="error"></label>
                </div>
                <?php echo $strTimeAgo = timeago($exhibitor_data[0]->created_at);?>                       
        </div>
        <?php
        function timeago($date) {
            $timestamp = strtotime($date);	
            
            $strTime = array("second", "minute", "hour", "day", "month", "year");
            $length = array("60","60","24","30","12","10");

            $currentTime = time();
            if($currentTime >= $timestamp) {
                $diff     = time()- $timestamp;
                for($i = 0; $diff >= $length[$i] && $i < count($length)-1; $i++) {
                $diff = $diff / $length[$i];
                }

                $diff = round($diff);
                return $diff . " " . $strTime[$i] . "(s) ago ";
            }
            }	
        ?>            
    
        <div class="container-fluid comments_area" id="commentToTop">
            <!-- Comment Form -->
            <div class="comment_box">
                <!-- Image of Account-->
                <div class="author_dp">
                <div><span class="<?php echo $activeUser;?>"></span><img src="<?php echo $url; ?>" style="border-radius:100px;"></div>
                </div> 
                <div class="comment">
                    <form id="comment_form">
                        <input type="hidden" name="user_id" id="user_id" value="<?php echo $admin_id;?>"/>
                        <input type="hidden" name="utype" id="utype" value="<?php echo $role; ?>"/>
                        <input type="hidden" name="ticket_id" id="ticket_id" value="<?php echo $exhibitor_data[0]->id;?>"/>
                        <input type="hidden" name="pid" id="pid" value="0"/>
                        <div class="form-group" id="commentTrigger">
                        <textarea class="form-control" name="comment" id="commentBox" placeholder="Enter your reply..."></textarea>
                        <label for="comment" generated="true" class="error"></label>
                        </div>
                        <div id='submit_button'>
                            <button id="postComment" class="btn bluebtn" style="margin:0 auto 20px;display:table;width:100%; max-width:280px;">Send Reply</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="comment_result"><?php echo $comments; ?></div>
        </div>
    </div>
</div>
<STYLE>
textarea {
  width: 800px;
  height: 150px;
}
.ppWrp{ position:relative}
.ppWrp:before {content:'';position:absolute;top: -4px;left: 0px;width: 8px;height: 8px;background: #00ff2b;border-radius: 100px;}
</STYLE>
<link href="https://registration.gjepc.org/manual_tritiya/helpdesk/assets/admin/css/comment.css" rel="stylesheet">