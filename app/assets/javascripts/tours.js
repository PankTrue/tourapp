

$(document).ready(function () {

    $('.datepicker').datepicker({ language: 'ru',autoclose: true, zIndexOffset: 1000 });


    $('#tours-datatable').dataTable({
        processing: true,
        serverSide: true,
        scrollX: true,
        ajax: {
          url: $('#tours-datatable').data('source')
        },
        pagingType: 'full_numbers',
        columns: [
          {
            data: 'id'
          }, {
            data: 'customer'
          }, {
            data: "manager"
          }, {
            data: "tour_operator"
          }, {
            data: "appeal"
          }, {
            data: "advertising_source"
          }, {
            data: "currency"
          }, {
            data: "passport_type"
          }, {
            data: "office_city"
          }, {
            data: "agency_represented"
          }, {
            data: "number_person"
          }, {
            data: "tour_country"
          }, {
            data: "tour_city"
          }, {
            data: "date_start"
          }, {
            data: "date_end"
          }, {
            data: "hotel_name"
          }, {
            data: "hotel_start"
          }, {
            data: "hotel_end"
          }, {
            data: "room_category"
          }, {
            data: "type_room"
          }, {
            data: "type_food"
          }, {
            data: "route_there"
          }, {
            data: "route_back"
          }, {
            data: "flight_number"
          }, {
            data: "fly_type"
          }, {
            data: "type_of_transport_there"
          }, {
            data: "type_of_transport_back"
          }, {
            data: "flight_type_there"
          }, {
            data: "flight_type_back"
          }, {
            data: "flight_back_class"
          }, {
            data: "number_flight_back"
          }, {
            data: "transfer_route"
          }, {
            data: "transfer_type"
          }, {
            data: "excursion_program"
          }, {
            data: "additional_service"
          }, {
            data: "cost_tour"
          }, {
            data: "prepaid"
          }, {
            data: "voluntary_insurance"
          }, {
            data: "prihodnik_date"
          }, {
            data: "prihodnik_prepaid"
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
  });
