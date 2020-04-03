class AddColumnToWeapons < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :name, :string
    add_column :weapons, :description, :string
    add_column :weapons, :level, :integer, default: 1
    add_column :weapons, :power_base, :integer
    add_column :weapons, :power_step, :integer
  end
end
