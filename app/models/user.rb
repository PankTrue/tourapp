class User < ApplicationRecord
  has_paper_trail

  has_many :clients
  has_many :tours




  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
