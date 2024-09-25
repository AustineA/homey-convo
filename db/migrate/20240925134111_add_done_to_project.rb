class AddDoneToProject < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :done, :boolean, null: false, default: false
  end
end
