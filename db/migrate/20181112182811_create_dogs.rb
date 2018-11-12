class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :gender
      t.string :size
      t.boolean :trained
      t.belongs_to :user

      t.timestamps
    end
  end
end
