class WishlistsController < ApplicationController

  before_action :authenticate_user!

  def index
  	@properties = current_user.favorite_properties
  end

  # SAVE
  def create

    property =
      Property.find(params[:property_id])

    current_user.wishlists
      .find_or_create_by(
        property: property
      )

    redirect_back fallback_location:
    properties_path

  end

  # UNSAVE
  def destroy

    wishlist =
      current_user.wishlists.find_by(
        property_id: params[:id]
      )

    wishlist.destroy if wishlist

    redirect_back fallback_location:
    properties_path

  end

end