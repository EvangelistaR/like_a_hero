class RemoveLevelFromWeapons < ActiveRecord::Migration[5.1]
  def change
    remove_column :weapons, :level, :integer
  end
end
