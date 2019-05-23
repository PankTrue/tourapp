class Client < ApplicationRecord
  has_paper_trail

  belongs_to :user

  has_many :tours, class_name: 'Tour', foreign_key: 'customer'

  has_and_belongs_to_many :tours

  accepts_nested_attributes_for :tours,
                                allow_destroy: true


  validates :name, presence: true
end
