class WishlistsController < ApplicationController
  def create
    @wishlist = Wishlist.new(wishlist_params)
    if @wishlist.save
      redirect_to '/'
    else
      redirect_to events_path
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:user_id, :dog_id)
  end
end
