class Client < ApplicationRecord
  has_paper_trail

  Gender_List = ['Мужской', 'Женский']

  belongs_to :user

  has_many :tours, class_name: 'Tour', foreign_key: 'customer'

  has_and_belongs_to_many :tours, :inverse_of => :clients

  accepts_nested_attributes_for :tours,
                                allow_destroy: true


  validates :name, presence: true
  validates :surname, presence: true
  validates :pantronymic, presence: true


end
