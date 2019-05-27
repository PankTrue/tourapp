class Tour < ApplicationRecord
  has_paper_trail

  Room_Category_List = ['Стандарт', 'Основное здание', 'Студия', 'Вилла', 'Семейный номер',
  'Двухэтажный номер', 'Улучшенная планировка', 'Улучшенная планировка', 'Де люкс',
  'Вид на море', 'Вид на сад', 'Вид на парк', 'Вид на бассейн', 'Вид на горы',
  'Вид на пески', 'Вид на город', 'Вид на окрестности', 'Вид на джунгли', 'Вид на океан']

  belongs_to :customer, class_name: 'Client',foreign_key: 'customer_id'

  belongs_to :user

  has_and_belongs_to_many :clients, :inverse_of => :tours

  accepts_nested_attributes_for :clients,
                                allow_destroy: true

  validates :customer_id, presence: true



  #TODO: fix validate clients (problem becouse custome creating client_tour in tour_controller)
  validate :no_duplicate_clients

private

  def no_duplicate_clients
    64.times {|i| print '-'}; puts ''
    puts self.client_id
    64.times {|i| print '-'}
    unless self.clients.map(&:id).uniq
      errors.add(:clients, "- can not be 2 of the same clients")
    end
  end
end
