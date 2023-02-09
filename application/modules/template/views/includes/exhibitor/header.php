<?php
   $user_session = $this->session->userdata('exhibitor');
    //  echo "----------------"; print_r($user_session);
    //$image = $user_session['image'];
    $image = "";
    $name = $user_session['Exhibitor_Name'];
?>

<header class="topbar">
  <nav class="navbar top-navbar navbar-expand-md navbar-dark">
    <div class="navbar-header">
      <a class="navbar-brand" href="<?php echo base_url('exhibitor/dashboard')?>">
        <b>
          <img src="<?php echo base_url();?>assets/admin/images/gjepc_logo.png" class="light-logo logo_sm" />
        </b> 
        <span>
          <img src="<?php echo  base_url();?>assets/admin/images/gjepc_logo_abs.png" class="light-logo logo_abs" style="background-color: #fff;"/>
        </span>
      </a>
    </div> 
    <div class="navbar-collapse ">
      <ul class="navbar-nav mr-auto ">
        <li class="nav-item"> <a class="nav-link nav-toggler d-block d-sm-none waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
        <li class="nav-item"> <a class="nav-link sidebartoggler d-none d-lg-block d-md-block waves-effect waves-dark" href="javascript:void(0)"><i class="icon-menu"></i></a> </li>
      </ul>
      <ul class="navbar-nav ml-auto mr-auto text-light text-center">
        <li> <h4>Exhibitor Ticket Dashboard </h4></li>
      </ul>
      <ul class="navbar-nav my-lg-0">
        <li class="nav-item dropdown u-pro">
          <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <?php if(!empty($image)){?> <img src="<?php echo base_url().$image; ?>" alt="user" class=""> <?php }?> 
            <span class=""><strong><?php echo strtoupper($name); ?></strong> &nbsp;
            <i class="fa fa-angle-down"></i></span>
          </a>
          <div class="dropdown-menu dropdown-menu-right animated flipInY">
            <!-- <a href="<?php echo base_url('exhibitor/my-profile')?>" class="dropdown-item"><i class="ti-settings" style="margin-right: 10px;"></i> My Profile</a>  -->
            <div class="dropdown-divider"></div>
            <a href="<?php echo base_url('exhibitor/logout')?>" class="dropdown-item"><i class="ti-power-off" style="margin-right: 10px;"></i> Logout</a> 
          </div>
        </li>
      </ul>
    </div>
  </nav>
</header>