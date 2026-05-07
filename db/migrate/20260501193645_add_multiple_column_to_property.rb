class AddMultipleColumnToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :property_type, :string
    add_column :properties, :status, :string
    add_column :properties, :address, :string
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :country, :string
    add_column :properties, :pincode, :string
    add_column :properties, :phone_number, :string
  end
end
