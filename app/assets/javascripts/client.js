
$(document).ready(function () {

    $('.datepicker').datepicker({ language: 'ru',autoclose: true, zIndexOffset: 1000 });

    datatables_init();

    select2_init($(".select2"));

    $('body').bind("cocoon:after-insert",function (e, inserted_item) {
        select=$(inserted_item).find(".select2");

        select2_init(select);
    })
});


function datatables_init() {
    $('#clients-datatable').dataTable({
        serverSide: true,
        scrollX: true,
        "search": {
            "caseInsensitive": false
        },
        ajax: {
            url: $('#clients-datatable').data('source')
        },
        pagingType: 'full_numbers',
        columns: [
            {
                data: 'id'
            }, {
                data: 'fio'
            },{
                data: "phone"
            }, {
                data: "email"
            }, {
                data: "created_at"
            }
        ],
        "language": {
            "processing": "Подождите...",
            "search": "Поиск:",
            "lengthMenu": "Показать _MENU_ записей",
            "info": "Записи с _START_ до _END_ из _TOTAL_ записей",
            "infoEmpty": "Записи с 0 до 0 из 0 записей",
            "infoFiltered": "(отфильтровано из _MAX_ записей)",
            "infoPostFix": "",
            "loadingRecords": "Загрузка записей...",
            "zeroRecords": "Записи отсутствуют.",
            "emptyTable": "В таблице отсутствуют данные",
            "paginate": {
                "first": "Первая",
                "previous": "Предыдущая",
                "next": "Следующая",
                "last": "Последняя"
            },
            "aria": {
                "sortAscending": ": активировать для сортировки столбца по возрастанию",
                "sortDescending": ": активировать для сортировки столбца по убыванию"
            }
        },
    });
}



function select2_init(element) {
    element.select2({
        ajax: {
            url: '/client/autocomplite',
            dataType: 'json',
            type: 'GET',
            delay: 250,
            data: function (params) {
                var query = {
                    q: params.term,
                }
                return query;
            },
            processResults: function(data, page) {
                var res = {
                    results: $.map( data, function(client, i) {
                        return { id: client.id, text: client.fio}
                    } )
                }
                return res;
            }
        }
    });
}