
class Streak < ApplicationRecord
  def length
    ((streak_started_at || Time.now) - updated_at).to_i
  end
end
