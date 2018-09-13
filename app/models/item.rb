# frozen_string_literal: true

class Item < ApplicationRecord
  def self.data_from(days_ago:)
    items = by_day(days_ago.days.ago)
    {
      items: items,
      total_calories: total_cals_from_items(items: items)
    }
  end

  def self.weekly_data
    items_from_week = past_week
    {
      total_calorie_intake: total_cals_from_items(items: items_from_week),
      average_calorie_intake: average_weekly_calories
    }
  end

  def self.total_cals_from_items(items: [])
    items.map(&:calories).reduce(:+) || 0
  end

  def self.average_weekly_calories
    daily_calories = (0..7).map do |n|
      total_cals_from_items(items: by_day(n.days.ago))
    end.reject(&:zero?)

    daily_calories.inject { |sum, el| sum + el }.to_f / daily_calories.length
  end
end
