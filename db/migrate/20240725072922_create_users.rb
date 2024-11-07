class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :userable_type, null: false
      t.integer :userable_id, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, limit: 1000
      t.string :password, limit: 500

      t.timestamps
    end
  end
end
