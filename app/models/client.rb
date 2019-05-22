class Client < ApplicationRecord
  has_paper_trail

  has_and_belongs_to_many :tours

  accepts_nested_attributes_for :tours,
                                allow_destroy: true


  validates :name, presence: true
end
