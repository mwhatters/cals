class AddColumnsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :consumed, :boolean, default: true
    add_column :items, :days_good_for, :integer
  end
end
