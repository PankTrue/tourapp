
    $(document).ready(function () {
        $('body').bind("cocoon:after-insert",function (e, inserted_item) {
            select=$(inserted_item).find(".select2");

            select.select2({
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


        })
    });




