class CreateItems < ActiveRecord::Migration[5.1]
  def up
    create_table :items do |t|
      t.string :name, null: false
      t.integer :calories, limit: 4, null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :items
  end
end
