class AddSignUpCodeToReader < ActiveRecord::Migration[5.2]
  def change
    add_column :readers, :sign_up_code, :string
  end
end
