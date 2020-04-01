class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :level, :integer, default: 1

    create_table :weapons do |t|

      t.timestamps
    end
  end
end
