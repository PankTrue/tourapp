class Tour < ApplicationRecord
  has_paper_trail

  # belongs_to :client, :class_name => 'Tour'

  belongs_to :user

  has_and_belongs_to_many :clients

  accepts_nested_attributes_for :clients,
                                allow_destroy: true

  validates :tour_operator, presence: true

end
