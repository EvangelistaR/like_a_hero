class AddAttributesToWeapon < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :name, :string
    add_column :weapons, :description, :string
    add_column :weapons, :level, :integer
    add_column :weapons, :power_base, :integer
    add_column :weapons, :power_step, :string
    add_column :weapons, :integer, :string
  end
end
