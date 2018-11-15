class CreateWishlist < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.belongs_to :user
      t.integer :dog_id
    end
  end
end
