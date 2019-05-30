class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.period_count_array(from = (Date.today-1.month).beginning_of_day,to = Date.today.end_of_day, where, group)
    where(created_at: from..to).group(group).where(where).count
  end
end
