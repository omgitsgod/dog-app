class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :location
      t.datetime :date
      t.string :address
      t.string :about

      t.timestamps
    end
  end
end
