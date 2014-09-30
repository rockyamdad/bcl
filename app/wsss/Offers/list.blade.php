@extends('layouts')
@section('content')
<div class="portlet box purple">
    <div class="portlet-title">
        <div class="caption"><i class="fa fa-cogs"></i>Offers List</div>
        <div class="actions">
            <a href="{{ URL::to('offers/add') }}" class="btn green"><i class="fa fa-plus"></i> Add Offer</a>
            <a href="{{ URL::to('offers/archivelist') }}" class="btn green"><i class="fa fa-plus"></i> Archive List</a>
            <a href="{{ URL::to('offers/deletelist') }}" class="btn green"><i class="fa fa-plus"></i>Delete List</a>
<!--            <a href="table_managed.html#" class="btn yellow"><i class="fa fa-print"></i> Print</a>-->
        </div>
    </div>
    <div class="portlet-body">
     @if (Session::has('message'))
        <div class="alert alert-success">
            <button data-close="alert" class="close"></button>
            {{ Session::get('message') }}
        </div>
            @endif
        <table class="table table-striped table-bordered table-hover" id="sample_3">
            <thead>
            <tr>
                <th class="table-checkbox"><input type="checkbox" class="group-checkable" data-set="#sample_3 .checkboxes" /></th>
                <th>Title</th>
                <th>Description</th>
                <th>Category</th>
                <th>Price</th>
                <th>Commission</th>
                <th>Quantity</th>
                <th>Line Total </th>
                @if(Request::is('offers/index'))
                <th>Status</th>
                @endif
                <th>Action</th>

            </tr>
            </thead>
            <tbody>
            @foreach($offers as $key => $value)
            <tr class="odd gradeX">

                <td> {{Form::checkbox('sex',1,false,array('class'=>'checkboxes','value'=>1))}}</td>
                <td> {{ $value-> title }}</td>
                <td> {{ $value-> description }}</td>
                <td> {{ ($value-> category -> category_name)? $value-> category -> category_name : $value-> category -> product -> product_name }}</td>
                <td> {{ $value-> price }}</td>
                <td> {{ $value-> price * $value-> quantity * ($value->commission/100) }}</td>
                <td> {{ $value-> quantity }}</td>
                <td> {{ $value-> line_total }}</td>
                @if(Request::is('offers/index'))
                <td> {{ $value-> status }}</td>
                @endif
                @if(Request::is('offers/deletelist') || Request::is('offers/archivelist'))
                <td> <a href="{{ URL::to('offers/details/'.$value->id)}}">Details</a></td>
                    @else
                <td> <a href="{{ URL::to('offers/details/'.$value->id)}}">Details</a> | <a href="{{ URL::to('offers/update/'.$value->id)}}">Update</a> |  <a href="{{ URL::to('offers/delete/'.$value->id)}}">Delete</a> | <a href="{{ URL::to('offers/archive/'.$value->id)}}">Archive</a> | </td>
                @endif

            </tr>
            @endforeach

            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    @section('javascript')
    jQuery(document).ready(function() {
    // Put page-specific javascript here
    $('#sample_3').dataTable({
        "aoColumns": [
            { "bSortable": false },
            null,
            null,
            null,
            null,
            null,
             @if(Request::is('offers/index'))
            { "bSortable": false },
        @endif
            { "bSortable": false },
            { "bSortable": false },
            { "bSortable": false }
        ],
        "aLengthMenu": [
            [5, 15, 20, -1],
            [5, 15, 20, "All"] // change per page values here
        ],
        // set the initial value
        "iDisplayLength": 15,
        "sPaginationType": "bootstrap",
        "oLanguage": {
            "sLengthMenu": "_MENU_ records",
            "oPaginate": {
                "sPrevious": "Prev",
                "sNext": "Next"
            }
        },
        "aoColumnDefs": [{
            'bSortable': false,
            'aTargets': [0]
        }
        ]
    });

        jQuery('#sample_3 .group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).attr("checked", true);
                } else {
                    $(this).attr("checked", false);
                }
            });
            jQuery.uniform.update(set);
        });
        jQuery('#sample_3_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
        jQuery('#sample_3_wrapper .dataTables_length select').addClass("form-control input-xsmall"); // modify table per page dropdown
        jQuery('#sample_3_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
        //var form1 = $('#user_update_form');
        var success1 = $('.alert-success');
        success1.fadeOut(5000);
    })
    @stop
</script>

@stop