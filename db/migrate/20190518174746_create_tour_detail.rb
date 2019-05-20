class CreateTourDetail < ActiveRecord::Migration[5.2]
  def change
    create_table :clients_tours, id: false do |t|
      t.belongs_to :tour, index: true
      t.belongs_to :client, index: true
    end
  end
end
