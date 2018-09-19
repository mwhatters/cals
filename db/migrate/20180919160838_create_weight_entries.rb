class CreateWeightEntries < ActiveRecord::Migration[5.1]
  def up
    create_table :weight_entries do |t|
      t.integer :weight, limit: 4, null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :weight_entries
  end
end
