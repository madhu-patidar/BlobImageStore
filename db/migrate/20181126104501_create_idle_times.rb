class CreateIdleTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :idle_times do |t|
      t.references :session, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
