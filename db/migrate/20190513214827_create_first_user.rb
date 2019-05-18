class CreateFirstUser < ActiveRecord::Migration[5.2]
  def up
    User.create({ :email                    => 'admin@admin.com',
                  :password                 => 'admin1488',
                  :password_confirmation    => 'admin1488'})
  end
end
