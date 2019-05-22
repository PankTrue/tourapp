class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.integer :customer_id
      t.integer :user_id
      t.string :tour_operator
      t.string :appeal
      t.string :advertising_source
      t.string :currency
      t.boolean :passport_type
      t.string :office_city
      t.string :agency_represented
      t.integer :number_person
      t.string :tour_country
      t.string :tour_city
      t.date :date_start
      t.date :date_end
      t.string :hotel_name
      t.date :hotel_start
      t.date :hotel_end
      t.string :room_category
      t.string :type_room
      t.string :type_food
      t.string :route_there
      t.string :route_back
      t.integer :flight_number
      t.string :fly_type
      t.string :type_of_transport_there
      t.string :type_of_transport_back
      t.string :flight_type_there
      t.string :flight_type_back
      t.string :flight_back_class
      t.integer :number_flight_back
      t.string :transfer_route
      t.string :transfer_type
      t.string :excursion_program
      t.string :additional_service
      t.integer :cost_tour
      t.integer :prepaid
      t.string :voluntary_insurance
      t.date :prihodnik_date
      t.integer :prihodnik_prepaid

      t.timestamps
    end
  end
end
