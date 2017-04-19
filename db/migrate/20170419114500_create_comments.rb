class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content, null: false
      t.references :post, foreign_key: true, null: false
      t.boolean :approved, null: false, default: true

      t.timestamps
    end
  end
end
