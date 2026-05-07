class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @properties = Property.all

  if params[:city].present? && params[:city] != 'all'
    @properties = @properties.where(city: params[:city])
  end

  if params[:query].present?
    q = "%#{params[:query]}%"

    @properties = @properties.where(
      "name LIKE ? OR location LIKE ? OR city LIKE ? OR property_type LIKE ? OR country LIKE ?",
      q, q, q, q, q
    )
  end

	  #Sorting
	  @properties = @properties.order(created_at: :desc)

	  #Pagination (Kaminari)
	  @properties = @properties.page(params[:page]).per(10)
   end

  def show
  end 

  def new
    @property = Property.new
  end

  def create
    # binding.pry
    @property = current_user.properties.new(properties_params)
    @property.property_owner = current_user.name
    if @property.save
    	PropertyEmailJob.perform_later(@property.id)
      	redirect_to properties_path, notice: "Property Created Successfully"
    else
      render :new
    end
  end

  def bulk_delete
  	Property.destroy_all
    redirect_to properties_path, notice: "All Property Deleted Successfully"
  end

  def update
    if @property.update(properties_params) 
      redirect_to properties_path, notice: "Property Updated Successfully"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "Property Deleted Successfully"
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def properties_params
    params.require(:property).permit(:name,
    :price,
    :location, 
    :description, 
    :latitude, 
    :longitude, 
    :property_type, 
    :status, 
    :address, 
    :city, 
    :state, 
    :country, 
    :pincode, 
    :phone_number, 
    :user_id, 
    :property_owner, 
    :image)
  end
end