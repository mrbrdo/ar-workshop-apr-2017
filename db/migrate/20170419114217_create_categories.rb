class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :slug, null: false

      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
