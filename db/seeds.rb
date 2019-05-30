main_passport_get_by = ['МВД по пидорaшкe']
international_passport_get_by = main_passport_get_by

client_ids = Client.pluck(:id)
user_ids = User.pluck(:id)

1000.times do
  Client.create( name: Faker::Name.first_name ,
                 surname: Faker::Name.last_name,
                 pantronymic: Faker::Name.first_name_men + 'ович',
                 gender: rand(2) ? 'Мужской' : 'Женский',
                 datebirth: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 phone: '+7' + rand.to_s[2..11],
                 email: Faker::Internet.email,
                 main_passport_series: rand(1000..9999),
                 main_passport_number: rand(1000000..999999),
                 main_passport_get_by: main_passport_get_by.sample,
                 main_passport_date_given: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 international_passport_series: rand(1000..9999),
                 international_passport_number: rand(1000000..999999),
                 international_passport_get_by: international_passport_get_by.sample,
                 international_passport_date_given: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 international_passport_date_end: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 user_id: 1
              )
end

5000.times do
  Tour.create(  customer_id: client_ids.sample,
                user_id: user_ids.sample,
                tour_operator: 'operator',
                appeal: 'appeal',
                advertising_source: 'advertising_source',
                currency: 'currency',
                passport_type: true,
                office_city: 'office_city',
                agency_represented: 'agency_represented',
                number_person: 'number_person',
                tour_country: ISO3166::Country.all_translated('RU').sample,
                tour_city: 'tour_city',
                date_start: rand(Date.civil(2018, 1, 1)..Date.civil(2020, 12, 31)),
                date_end: rand(Date.civil(2018, 1, 1)..Date.civil(2020, 12, 31)),
                hotel_name: 'hotel',
                hotel_start: rand(Date.civil(2018, 1, 1)..Date.civil(2020, 12, 31)),
                hotel_end: rand(Date.civil(2018, 1, 1)..Date.civil(2020, 12, 31)),
                room_category: Tour::Room_Category_List.sample,
                type_room: 'type_room',
                type_food: 'type_food',
                route_there: 'route_there',
                route_back: 'route_back',
                flight_number: rand(10000),
                fly_type: 'fly_type',
                type_of_transport_there: 'type_of_transport_there',
                type_of_transport_back: 'type_of_transport_back',
                flight_type_there: 'flight_type_there',
                flight_type_back: 'flight_type_back',
                flight_back_class: 'flight_back_class',
                number_flight_back: rand(10000),
                transfer_route: 'transfer_route',
                transfer_type: 'transfer_type',
                excursion_program: 'excursion_program',
                additional_service: 'additional_service',
                cost_tour: rand(1000000),
                prepaid: rand(1000000),
                voluntary_insurance: 'voluntary_insurance',
                prihodnik_date: rand(Date.civil(2018, 1, 1)..Date.civil(2020, 12, 31)),
                prihodnik_prepaid: rand(1000000)
          )
end