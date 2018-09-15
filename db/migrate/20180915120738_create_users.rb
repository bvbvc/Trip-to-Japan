class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :e_mail
      t.string :password_digest
      t.text :comment
      t.text :detail
      t.string :image
     
      

      t.timestamps
    end
  end
end
