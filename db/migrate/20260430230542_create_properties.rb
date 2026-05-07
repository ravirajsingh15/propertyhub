class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.decimal :price
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
