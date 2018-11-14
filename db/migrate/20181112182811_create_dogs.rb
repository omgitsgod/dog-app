class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :age
      t.string :mix
      t.string :breeds, array: true
      t.string :sex
      t.string :size
      t.string :options, array: true
      t.string :description_sanitized
      t.belongs_to :user

      t.timestamps
    end
  end
end
