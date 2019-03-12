class HomeController < ApplicationController
  def index
    @today_items_data = ::Item.consumed_data_from(days_ago: 0)

    @one_day_ago_items_data = ::Item.consumed_data_from(days_ago: 1)
    @two_day_ago_items_data = ::Item.consumed_data_from(days_ago: 2)
    @three_day_ago_items_data = ::Item.consumed_data_from(days_ago: 3)
    @four_day_ago_items_data = ::Item.consumed_data_from(days_ago: 4)
    @five_day_ago_items_data = ::Item.consumed_data_from(days_ago: 5)
    @six_day_ago_items_data = ::Item.consumed_data_from(days_ago: 6)
    @seven_day_ago_items_data = ::Item.consumed_data_from(days_ago: 7)

    @weekly_consumption_data = ::Item.weekly_consumption_data

    @inventory = ::Item.inventory

    @streaks = Streak.all
  end
end
