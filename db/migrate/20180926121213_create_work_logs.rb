class CreateWorkLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :work_logs do |t|
      t.belongs_to :session, index: true

      t.timestamps
    end
  end
end
