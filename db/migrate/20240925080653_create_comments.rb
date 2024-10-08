class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :project, null: false, foreign_key: true
      t.string :author

      t.timestamps
    end
  end
end
