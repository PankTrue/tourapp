class Tour < ApplicationRecord
  has_paper_trail

  has_and_belongs_to_many :clients

  accepts_nested_attributes_for :clients,
                                allow_destroy: true
end
