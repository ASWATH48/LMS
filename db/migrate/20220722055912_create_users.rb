class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email_id, unique_key: true
      t.string :username, unique_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
