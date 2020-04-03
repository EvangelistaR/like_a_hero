class RemoveIntegerFromWeapons < ActiveRecord::Migration[5.1]
  def change
    remove_column :weapons, :integer, :string
  end
end
