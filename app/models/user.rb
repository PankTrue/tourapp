class User < ApplicationRecord
  has_paper_trail

  has_many :clients
  has_many :tours


  has_many :tours, class_name: 'Tour', foreign_key: 'customer'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
