require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:one)
  end

  test "should get index" do
    get tours_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_url
    assert_response :success
  end

  test "should create tour" do
    assert_difference('Tour.count') do
      post tours_url, params: { tour: { additional_service: @tour.additional_service, advertising_source: @tour.advertising_source, agency_represented: @tour.agency_represented, appeal: @tour.appeal, cost_tour: @tour.cost_tour, currency: @tour.currency, customer_id: @tour.customer_id, date_end: @tour.date_end, date_start: @tour.date_start, excursion_program: @tour.excursion_program, flight_back_class: @tour.flight_back_class, flight_number: @tour.flight_number, flight_type_back: @tour.flight_type_back, flight_type_there: @tour.flight_type_there, fly_type: @tour.fly_type, hotel_end: @tour.hotel_end, hotel_name: @tour.hotel_name, hotel_start: @tour.hotel_start, manager: @tour.manager, number_flight_back: @tour.number_flight_back, number_person: @tour.number_person, office_city: @tour.office_city, passport_type: @tour.passport_type, prepaid: @tour.prepaid, prihodnik_date: @tour.prihodnik_date, prihodnik_prepaid: @tour.prihodnik_prepaid, room_category: @tour.room_category, route_back: @tour.route_back, route_there: @tour.route_there, tour_city: @tour.tour_city, tour_country: @tour.tour_country, tour_operator: @tour.tour_operator, transfer_route: @tour.transfer_route, transfer_type: @tour.transfer_type, type_food: @tour.type_food, type_of_transport_back: @tour.type_of_transport_back, type_of_transport_there: @tour.type_of_transport_there, type_room: @tour.type_room, voluntary_insurance: @tour.voluntary_insurance } }
    end

    assert_redirected_to tour_url(Tour.last)
  end

  test "should show tour" do
    get tour_url(@tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_url(@tour)
    assert_response :success
  end

  test "should update tour" do
    patch tour_url(@tour), params: { tour: { additional_service: @tour.additional_service, advertising_source: @tour.advertising_source, agency_represented: @tour.agency_represented, appeal: @tour.appeal, cost_tour: @tour.cost_tour, currency: @tour.currency, customer_id: @tour.customer_id, date_end: @tour.date_end, date_start: @tour.date_start, excursion_program: @tour.excursion_program, flight_back_class: @tour.flight_back_class, flight_number: @tour.flight_number, flight_type_back: @tour.flight_type_back, flight_type_there: @tour.flight_type_there, fly_type: @tour.fly_type, hotel_end: @tour.hotel_end, hotel_name: @tour.hotel_name, hotel_start: @tour.hotel_start, manager: @tour.manager, number_flight_back: @tour.number_flight_back, number_person: @tour.number_person, office_city: @tour.office_city, passport_type: @tour.passport_type, prepaid: @tour.prepaid, prihodnik_date: @tour.prihodnik_date, prihodnik_prepaid: @tour.prihodnik_prepaid, room_category: @tour.room_category, route_back: @tour.route_back, route_there: @tour.route_there, tour_city: @tour.tour_city, tour_country: @tour.tour_country, tour_operator: @tour.tour_operator, transfer_route: @tour.transfer_route, transfer_type: @tour.transfer_type, type_food: @tour.type_food, type_of_transport_back: @tour.type_of_transport_back, type_of_transport_there: @tour.type_of_transport_there, type_room: @tour.type_room, voluntary_insurance: @tour.voluntary_insurance } }
    assert_redirected_to tour_url(@tour)
  end

  test "should destroy tour" do
    assert_difference('Tour.count', -1) do
      delete tour_url(@tour)
    end

    assert_redirected_to tours_url
  end
end
