class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id, index: true
      t.string :user_email, index: true
      t.timestamps
    end
  end
end
