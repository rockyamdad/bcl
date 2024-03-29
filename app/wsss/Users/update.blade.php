@extends('layouts')
@section('content')
<div class="col-md-12">
    <!-- BEGIN VALIDATION STATES-->
    <div class="portlet box purple">
        <div class="portlet-title">
            <div class="caption"><i class="fa fa-reorder"></i>Update User</div>

        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            {{Form::model($userdata,array('action' => array('UserController@putCheckupdate', $userdata->id), 'method' => 'PUT', 'class'=>'form-horizontal', 'id'=>'user_update_form'))}}
            <div class="form-body">
                <div class="alert alert-danger display-hide">
                    <button data-close="alert" class="close"></button>
                    You have some form errors. Please check below.
                </div>
                <div class="alert alert-success display-hide">
                    <button data-close="alert" class="close"></button>
                    Your form validation is successful!
                </div>
                <div class="form-group">
                    {{HTML::decode(Form::label('firstname','First Name<span class="required">*</span>',array('class' => 'control-label col-md-3')))}}
                    <div class="col-md-4">
                        {{Form::text('first_name',null,array('placeholder' => 'First Name', 'class' => 'form-control','id' => 'firstname'))}}
                    </div>
                </div>
                <div class="form-group">
                    {{HTML::decode(Form::label('lastname','Last Name<span class="required">*</span>',array('class' => 'control-label col-md-3')))}}
                    <div class="col-md-4">
                        {{Form::text('last_name',null,array('placeholder' => 'Last Name', 'class' => 'form-control','id' => 'lastname'))}}
                    </div>
                </div>
                <div class="form-group">
                    {{HTML::decode(Form::label('email','Email<span class="required">*</span>',array('class' => 'control-label col-md-3')))}}
                    <div class="col-md-4">
                        {{Form::text('email',null,array('placeholder' => 'Email', 'class' => 'form-control','id' => 'email'))}}
                    </div>
                </div>

                <div class="form-group">
                    {{HTML::decode(Form::label('phone','Phone No',array('class' => 'control-label col-md-3')))}}
                    <div class="col-md-4">
                        {{Form::text('phone',null,array('placeholder' => 'Phone No', 'class' => 'form-control','id' => 'phone'))}}
                    </div>
                </div>
                <div class="form-group">
                    {{Form::label('country','Country Name', array('class' => 'control-label col-md-3'))}}
                    <div class="col-md-4">
                        {{Form::select('country_id', $country,$userdata->country_id, array('class'=>'form-control'))}}
                    </div>
                </div>

                <div class="form-group">
                    {{HTML::decode(Form::label('company_name','Company Name',array('class' => 'control-label col-md-3')))}}
                    <div class="col-md-4">
                        {{Form::text('company_name',null,array('placeholder' => 'Company Name', 'class' => 'form-control','id' => 'company_name'))}}
                    </div>
                </div>
                <div class="form-group">
                    {{HTML::decode(Form::label('address','Address',array('class' => 'control-label col-md-3')))}}
                    <div class="col-md-4">
                        {{Form::textarea('address',null,array('class' => 'form-control','id' => 'address', 'rows'=>'3'))}}
                    </div>
                </div>
                <div class="form-group">
                    {{Form::label('group_id','User Type', array('class' => 'control-label col-md-3'))}}
                    <div class="col-md-4">
                        {{Form::select('group_id',array('1' => 'Admin','2' => 'Manager'),$userdata->group_id, array('class'=>'form-control') )}}
                    </div>
                </div>


                <div class="form-group">
                    {{Form::label('sex','Sex',array('class' => 'col-md-3 control-label'))}}


                    <div class="col-md-9">
                        <div class="radio-list">
                            <label>
                                {{Form::radio('sex',1,true)}}  {{Form::label('Male')}}
                            </label>
                            <label>
                                {{Form::radio('sex',0)}}  {{Form::label('Female')}}
                            </label>

                        </div>
                    </div>
                </div>


            </div>
            <div class="form-actions fluid">
                <div class="col-md-offset-3 col-md-9">
                    {{Form::button('Save',array('type' => 'submit','class' => 'btn green','id' => 'save'))}}
                    {{Form::button('Cancel',array('type'=>'reset', 'class' => 'btn default','id' => 'cancel'))}}

                </div>
            </div>
            {{Form::close()}}
            <!-- END FORM-->
        </div>
    </div>
    <!-- END VALIDATION STATES-->
</div>
<script type="text/javascript">
    @section('javascript')
    jQuery(document).ready(function() {
        // Put page-specific javascript here
        var form1 = $('#user_update_form');
        var error1 = $('.alert-danger', form1);
        var success1 = $('.alert-success', form1);

        form1.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                first_name: {
                    minlength: 2,
                    required: true
                },
                last_name: {
                    minlength: 2,
                    required: true
                },
                password: {
                    minlength: 6,
                    required: true
                },
                email: {
                    required: true,
                    email: true
                }

            },

            invalidHandler: function (event, validator) { //display error alert on form submit
                success1.hide();
                error1.show();
                App.scrollTo(error1, -200);
            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label
                    .closest('.form-group').removeClass('has-error'); // set success class to the control group
            }

            /* submitHandler: function (form) {
             success1.show();
             error1.hide();
             }*/
        });
    });

    @stop
</script>
@stop
