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


  def clients_attributes=(attributes)
    self.clients = attributes.values.map { |item| Client.find(item['id']) }
    super(attributes)
  end
private



  def Tour::is_clients_uniq client_ids
    client_ids.map{|v| v[:id]}.uniq!.nil? ? true : false
  end
end





