
class WeightEntry < ApplicationRecord
  def self.weight_entry_from(days_ago:)
    by_day(days_ago.days.ago).first
  end
end
