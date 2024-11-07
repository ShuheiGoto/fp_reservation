class CreateGeneralUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :general_users do |t|

      t.timestamps
    end
  end
end
