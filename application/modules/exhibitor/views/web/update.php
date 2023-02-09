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
                            <input class="form-control" type="text" name="subject" id="subject" value="<?php echo $exhibitor_data[0]->subject ?>">
                            <label for="subject" generated="true" class="error"></label>
                        </div>                        
                    </div>

                    <div class="form-group row">
                        <label for="example-search-input" class="col-sm-12 col-form-label"><strong>SELECT DEPARTMENT</strong></label>
                        <div class="col-sm-12">
                            <select class="form-control" name="department" id="department">                            
                              <option value="">SELECT DEPARTMENT</option>
                                <?php foreach($departments as $val){ ?>
                                <option value="<?php echo $val->id; ?>" <?php echo $val->id == $exhibitor_data[0]->department_id ? 'selected' : ''; ?>><?php echo strtoupper($val->name); ?></option>
                                <?php } ?>
							</select>
                            <label for="department" generated="true" class="error"></label>
                        </div>                        
                    </div>
                   
                    <!-- <div class="form-group row">
                        <label for="example-search-input" class="col-sm-12 col-form-label"><strong>PHOTO</strong></label>
                        <div class="col-sm-12">
                            <input type="file" class="form-control" name="exh_photo" id="exh_photo">
                            <label for="exh_photo" generated="true" class="error"></label>
                        </div>                        
                    </div> -->
					<div class="form-group  row">
                        <label for="example-text-input" class="col-sm-10 col-form-label"><strong>DESCRIPTION</strong></label>
                        <div class="col-sm-12">
                            <textarea name="description" class="form-control" id="description" cols="50" rows="5"><?php echo $exhibitor_data[0]->description; ?></textarea>
                            <label for="description" generated="true" class="error"></label>
                        </div>                        
                    </div>

                    <div class="form-group  row hidden">
                        <div class="col-sm-12">
                        <input class="form-control" type="hidden" name="unique_code" id="unique_code" value="<?php echo $exhibitor_data[0]->unique_code ?>">
                            <label for="unique_code" generated="true" class="error"></label>
                        </div>                        
                    </div>

                    <div class="form-group row">
                        
                        <div class="col-10">
                            <input class="btn btn-success" type="submit"  name="submit" value="submit">
                            <button class="btn " type="Reset">Reset</button>
                        </div>
                    </div>
                    
                    
                </form>
            </div>
        </div>
    </div>
</div>

