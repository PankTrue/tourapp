
    $(document).ready(function () {

        datatables_init();

        select2_init($(".select2"));

        $('body').bind("cocoon:after-insert",function (e, inserted_item) {
            select=$(inserted_item).find(".select2");

            select2_init(select);
        })
    });






function datatables_init() {
    $('#clients-datatable').dataTable({
        // processing: true,
        serverSide: true,

        search: {
            caseInsensitive: false
        },

        ajax: {
            url: $('#clients-datatable').data('source')
        },
        pagingType: 'full_numbers',
        columns: [
            {
                data: 'id'
            }, {
                data: 'FIO'
            }, {
                data: "phone"
            }, {
                data: "email"
            }, {
                data: "created_at"
            }, {
                data: "edit"
            }, {
                data: "delete"
            }
        ]
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
                        return { id: client.id, text: client.name + ' ' + client.surname }
                    } )
                }
                return res;
            }
        }
    });
}