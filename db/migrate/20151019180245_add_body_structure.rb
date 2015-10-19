class AddBodyStructure < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    end

    create_table :users  do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token

    create_table :shouts do |t|
      t.string :shout
      t.belongs_to :movie, index:true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
