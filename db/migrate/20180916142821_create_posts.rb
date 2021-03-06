class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.references :category, foreign_key: true
      t.references :place, foreign_key: true
      t.string :eye_catch
      t.text :content

      t.timestamps
    end
  end
end
