class TourDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :tour, :edit_tour_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||=
    {
      id: { source: "Tour.id", cond: :eq },
      customer_id: { source: "Tour.customer_id" },
      tour_operator: { source: "Tour.tour_operator" },
      appeal: { source: "Tour.appeal" },
      advertising_source: { source: "Tour.advertising_source" },
      currency: { source: "Tour.currency" },
      passport_type: { source: "Tour.passport_type" },
      office_city: { source: "Tour.office_city" },
      agency_represented: { source: "Tour.agency_represented" },
      manager: { source: "Tour.manager" },
      number_person: { source: "Tour.number_person" },
      tour_country: { source: "Tour.tour_country" },
      tour_city: { source: "Tour.tour_city" },
      date_start: { source: "Tour.date_start" },
      date_end: { source: "Tour.date_end" },
      hotel_name: { source: "Tour.hotel_name" },
      hotel_start: { source: "Tour.hotel_start" },
      hotel_end: { source: "Tour.hotel_end" },
      room_category: { source: "Tour.room_category" },
      type_room: { source: "Tour.type_room" },
      type_food: { source: "Tour.type_food" },
      route_there: { source: "Tour.route_there" },
      route_back: { source: "Tour.route_back" },
      flight_number: { source: "Tour.flight_number" },
      fly_type: { source: "Tour.fly_type" },
      type_of_transport_there: { source: "Tour.type_of_transport_there" },
      type_of_transport_back: { source: "Tour.type_of_transport_back" },
      flight_type_there: { source: "Tour.flight_type_there" },
      flight_type_back: { source: "Tour.flight_type_back" },
      flight_back_class: { source: "Tour.flight_back_class" },
      number_flight_back: { source: "Tour.number_flight_back" },
      transfer_route: { source: "Tour.transfer_route" },
      transfer_type: { source: "Tour.transfer_type" },
      excursion_program: { source: "Tour.excursion_program" },
      additional_service: { source: "Tour.additional_service" },
      cost_tour: { source: "Tour.cost_tour" },
      prepaid: { source: "Tour.prepaid" },
      voluntary_insurance: { source: "Tour.voluntary_insurance" },
      prihodnik_date: { source: "Tour.prihodnik_date" },
      prihodnik_prepaid: { source: "Tour.prihodnik_prepaid" }
    }
  end

  def data
    records.map do |record|
      {
        id: link_to(record.id, "/tours/#{record.id}", :class => 'btn btn-sm btn-default', data: { modal: true }),
        customer_id: record.customer_id,
        tour_operator: record.tour_operator,
        appeal: record.appeal,
        advertising_source: record.advertising_source,
        currency: record.currency,
        passport_type: record.passport_type,
        office_city: record.office_city,
        agency_represented: record.agency_represented,
        number_person: record.number_person,
        tour_country: record.tour_country,
        tour_city: record.tour_city,
        date_start: record.date_start,
        date_end: record.date_end,
        hotel_name: record.hotel_name,
        hotel_start: record.hotel_start,
        hotel_end: record.hotel_end,
        room_category: record.room_category,
        type_room: record.type_room,
        type_food: record.type_food,
        route_there: record.route_there,
        route_back: record.route_back,
        flight_number: record.flight_number,
        fly_type: record.fly_type,
        type_of_transport_there: record.type_of_transport_there,
        type_of_transport_back: record.type_of_transport_back,
        flight_type_there: record.flight_type_there,
        flight_type_back: record.flight_type_back,
        flight_back_class: record.flight_back_class,
        number_flight_back: record.number_flight_back,
        transfer_route: record.transfer_route,
        transfer_type: record.transfer_type,
        excursion_program: record.excursion_program,
        additional_service: record.additional_service,
        cost_tour: record.cost_tour,
        prepaid: record.prepaid,
        voluntary_insurance: record.voluntary_insurance,
        prihodnik_date: record.prihodnik_date,
        prihodnik_prepaid: record.prihodnik_prepaid
      }
    end
  end

  def get_raw_records
    Tour.all
  end

end
