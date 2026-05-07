class AddPropertyOwnerToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :property_owner, :string
  end
end
