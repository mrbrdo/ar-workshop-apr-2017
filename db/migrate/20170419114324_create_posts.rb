class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :slug, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_at
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end

    add_index :posts, [:category_id, :slug], unique: true
  end
end
