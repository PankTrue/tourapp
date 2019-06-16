class Client < ApplicationRecord
  has_paper_trail

  Gender_List = ['Мужской', 'Женский']

  belongs_to :user

  has_many :tours, class_name: 'Tour', foreign_key: 'customer'


  has_and_belongs_to_many :tours, :inverse_of => :clients

  accepts_nested_attributes_for :tours,
                                allow_destroy: true


  validates :fio, presence: true


  validate :fio_upcase



  def name
    self.fio.split(' ')[0]
  end

  def surname
    self.fio.split(' ')[1]
  end

  def pantronymic
    self.fio.split(' ')[2]
  end

  def fio
    self[:fio].blank? ? '' : self[:fio].split(' ').map{|v| v.capitalize}.join(' ')
  end


private
  def fio_upcase
    self.fio.downcase!
  end

  # def validate_fio
  #   errors.add(:clients, "UNIQUE") if self.fio.split(' ').size < 3
  # end
end
