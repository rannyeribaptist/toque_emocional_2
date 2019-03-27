class AddAvatarToReader < ActiveRecord::Migration[5.2]
  def change
    add_column :readers, :avatar, :string
  end
end
