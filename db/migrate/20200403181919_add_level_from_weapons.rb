class AddLevelFromWeapons < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :level, :integer, default: 1
  end
end
