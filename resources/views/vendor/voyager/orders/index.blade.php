@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->display_name_plural)

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-list-add"></i> {{ $dataType->display_name_plural }}
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>Objednávateľ</th>
                                <th>Číslo objednávky</th>
                                <th>Aktuálny stav</th>
                                <th>Hodnota objednávky</th>
                                <th>Spôsob dopravy</th>
                                <th>Dátum prijatia</th>
                                <th class="actions text-right">Zobraziť</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($orders as $order)
                                <tr>
                                    <td>{{ $order->customer }}</td>
                                    <td>{{ $order->number }}</td>
                                    <td>{{ $order->status->name }}</td>
                                    <td>{{ $order->total_price }}</td>
                                    <td>{{ $order->shipping->name }}</td>
                                    <td>{{ $order->created_at }}</td>
                                    <td class="no-sort no-click bread-actions">
                                        @can('delete', $order)
                                            <div class="btn btn-sm btn-danger pull-right delete" data-id="{{ $order->id }}">
                                                <i class="voyager-trash"></i> {{ __('voyager::generic.delete') }}
                                            </div>
                                        @endcan
                                        <a href="{{ route('voyager.orders.show', $order->id) }}" class="btn btn-sm btn-warning pull-right edit">
                                            <i class="voyager-eye"></i> Zobraziť
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">
                        <i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ $dataType->display_name_singular }}?
                    </h4>
                </div>
                <div class="modal-footer">
                    <form action="#" id="delete_form" method="POST">
                        {{ method_field("DELETE") }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm" value="{{ __('voyager::generic.delete_this_confirm') }} {{ $dataType->display_name_singular }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div>
        </div>
    </div>
@stop

@section('javascript')
    <!-- DataTables -->
    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable({
                "order": [],
                "language": {!! json_encode(__('voyager::datatable'), true) !!},
                "columnDefs": [{"targets": -1, "searchable":  false, "orderable": false}]
                @if(config('dashboard.data_tables.responsive')), responsive: true @endif
            });
        });

        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', ['menu' => '__menu']) }}'.replace('__menu', $(this).data('id'));

            $('#delete_modal').modal('show');
        });
    </script>
@stop
