class CreateImageStores < ActiveRecord::Migration[5.1]
  def change
    create_table :image_stores do |t|
      t.belongs_to :session, index: true

      t.timestamps
    end
  end
end
