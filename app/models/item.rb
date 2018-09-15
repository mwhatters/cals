# frozen_string_literal: true

class Item < ApplicationRecord
  def self.consumed_data_from(days_ago:)
    items = by_day(days_ago.days.ago).where(consumed: true)
    {
      items: items,
      total_calories: total_cals_from_items(items: items)
    }
  end

  def self.weekly_consumption_data
    items_from_week = past_week.where(consumed: true)
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
      consumed_items = by_day(n.days.ago).where(consumed: true)
      total_cals_from_items(items: consumed_items)
    end.reject(&:zero?)

    daily_calories.inject { |sum, el| sum + el }.to_f / daily_calories.length
  end

  def self.inventory
    where(consumed: false)
  end

  def expiry_date
    return if days_good_for.nil?
    created_at + days_good_for.days
  end

  def expired?
    created_at + days_good_for.days < Time.now
  end
end

