class RemoveLevelAndPowerStepFromWeapons < ActiveRecord::Migration[5.1]
  def change
    remove_column :weapons, :level, :integer
    remove_column :weapons, :power_step, :string
  end
end
