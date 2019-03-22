class RemoveColumnsFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :name
    remove_column :guests, :classy
    remove_column :guests, :groupy
    remove_column :guests, :school_id
  end
end
