class AddToColumnToProperties < ActiveRecord::Migration[7.1]
  
  def change
    add_column :properties, :latitude, :decimal, precision: 10, scale: 6
    add_column :properties, :longitude, :decimal, precision: 10, scale: 6

    add_index :properties, [:latitude, :longitude], algorithm: :inplace
  end
end
