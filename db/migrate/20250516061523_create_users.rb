class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :preferred_language
      t.string :reset_token
      t.datetime :reset_sent_at
      t.boolean :admin

      t.timestamps
    end
  end
end
