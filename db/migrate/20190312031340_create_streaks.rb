class CreateStreaks < ActiveRecord::Migration[5.1]
  def up
    create_table :streaks do |t|
      t.string :name, null: false
      t.datetime :streak_started_at
      t.timestamps null: false
    end
  end

  def down
    drop_table :streaks
  end
end
