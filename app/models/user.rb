class User < ApplicationRecord
  has_paper_trail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  has_many :clients
  has_many :tours

end
