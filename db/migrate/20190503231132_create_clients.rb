class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string  :fio
      t.string  :gender
      t.date    :datebirth
      t.string  :phone
      t.string  :additional_phone
      t.string  :email

      t.integer :main_passport_series
      t.integer :main_passport_number
      t.string  :main_passport_get_by
      t.date    :main_passport_date_given

      t.integer :international_passport_series
      t.integer :international_passport_number
      t.string  :international_passport_get_by
      t.date    :international_passport_date_given
      t.date    :international_passport_date_end

      t.integer :user_id



      t.timestamps
    end
  end
end
