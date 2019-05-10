class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string  :name
      t.string  :surname
      t.string  :pantronymic
      t.string  :gender
      t.date    :datebirth
      t.string  :phone
      t.string  :additional_phone
      t.string  :email
      t.integer :main_passport_series
      t.integer :main_passport_number
      t.integer :main_passport_get_by
      t.integer :main_passport_date_given
      t.integer :main_passport_date_end
      t.integer :international_passport_series
      t.integer :international_passport_number
      t.string  :international_passport_get_by
      t.date    :international_passport_date_given
      t.date    :international_passport_date_end

      t.timestamps
    end
  end
end
