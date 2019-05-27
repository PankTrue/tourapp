class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.period_count_array(from = (Date.today-1.month).beginning_of_day,to = Date.today.end_of_day, manager_id)
    where(created_at: from..to).group('date(created_at)').where(user_id: manager_id, ).count
  end
end
