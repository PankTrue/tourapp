require "application_system_test_case"

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:one)
  end

  test "visiting the index" do
    visit tours_url
    assert_selector "h1", text: "Tours"
  end

  test "creating a Tour" do
    visit tours_url
    click_on "New Tour"

    fill_in "Additional service", with: @tour.additional_service
    fill_in "Advertising source", with: @tour.advertising_source
    fill_in "Agency represented", with: @tour.agency_represented
    fill_in "Appeal", with: @tour.appeal
    fill_in "Cost tour", with: @tour.cost_tour
    fill_in "Currency", with: @tour.currency
    fill_in "Customer", with: @tour.customer_id
    fill_in "Date end", with: @tour.date_end
    fill_in "Date start", with: @tour.date_start
    fill_in "Excursion program", with: @tour.excursion_program
    fill_in "Flight back class", with: @tour.flight_back_class
    fill_in "Flight number", with: @tour.flight_number
    fill_in "Flight type back", with: @tour.flight_type_back
    fill_in "Flight type there", with: @tour.flight_type_there
    fill_in "Fly type", with: @tour.fly_type
    fill_in "Hotel end", with: @tour.hotel_end
    fill_in "Hotel name", with: @tour.hotel_name
    fill_in "Hotel start", with: @tour.hotel_start
    fill_in "Manager", with: @tour.manager
    fill_in "Number flight back", with: @tour.number_flight_back
    fill_in "Number person", with: @tour.number_person
    fill_in "Office city", with: @tour.office_city
    check "Passport type" if @tour.passport_type
    fill_in "Prepaid", with: @tour.prepaid
    fill_in "Prihodnik date", with: @tour.prihodnik_date
    fill_in "Prihodnik prepaid", with: @tour.prihodnik_prepaid
    fill_in "Room category", with: @tour.room_category
    fill_in "Route back", with: @tour.route_back
    fill_in "Route there", with: @tour.route_there
    fill_in "Tour city", with: @tour.tour_city
    fill_in "Tour country", with: @tour.tour_country
    fill_in "Tour operator", with: @tour.tour_operator
    fill_in "Transfer route", with: @tour.transfer_route
    fill_in "Transfer type", with: @tour.transfer_type
    fill_in "Type food", with: @tour.type_food
    fill_in "Type of transport back", with: @tour.type_of_transport_back
    fill_in "Type of transport there", with: @tour.type_of_transport_there
    fill_in "Type room", with: @tour.type_room
    fill_in "Voluntary insurance", with: @tour.voluntary_insurance
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "updating a Tour" do
    visit tours_url
    click_on "Edit", match: :first

    fill_in "Additional service", with: @tour.additional_service
    fill_in "Advertising source", with: @tour.advertising_source
    fill_in "Agency represented", with: @tour.agency_represented
    fill_in "Appeal", with: @tour.appeal
    fill_in "Cost tour", with: @tour.cost_tour
    fill_in "Currency", with: @tour.currency
    fill_in "Customer", with: @tour.customer_id
    fill_in "Date end", with: @tour.date_end
    fill_in "Date start", with: @tour.date_start
    fill_in "Excursion program", with: @tour.excursion_program
    fill_in "Flight back class", with: @tour.flight_back_class
    fill_in "Flight number", with: @tour.flight_number
    fill_in "Flight type back", with: @tour.flight_type_back
    fill_in "Flight type there", with: @tour.flight_type_there
    fill_in "Fly type", with: @tour.fly_type
    fill_in "Hotel end", with: @tour.hotel_end
    fill_in "Hotel name", with: @tour.hotel_name
    fill_in "Hotel start", with: @tour.hotel_start
    fill_in "Manager", with: @tour.manager
    fill_in "Number flight back", with: @tour.number_flight_back
    fill_in "Number person", with: @tour.number_person
    fill_in "Office city", with: @tour.office_city
    check "Passport type" if @tour.passport_type
    fill_in "Prepaid", with: @tour.prepaid
    fill_in "Prihodnik date", with: @tour.prihodnik_date
    fill_in "Prihodnik prepaid", with: @tour.prihodnik_prepaid
    fill_in "Room category", with: @tour.room_category
    fill_in "Route back", with: @tour.route_back
    fill_in "Route there", with: @tour.route_there
    fill_in "Tour city", with: @tour.tour_city
    fill_in "Tour country", with: @tour.tour_country
    fill_in "Tour operator", with: @tour.tour_operator
    fill_in "Transfer route", with: @tour.transfer_route
    fill_in "Transfer type", with: @tour.transfer_type
    fill_in "Type food", with: @tour.type_food
    fill_in "Type of transport back", with: @tour.type_of_transport_back
    fill_in "Type of transport there", with: @tour.type_of_transport_there
    fill_in "Type room", with: @tour.type_room
    fill_in "Voluntary insurance", with: @tour.voluntary_insurance
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour" do
    visit tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour was successfully destroyed"
  end
end
