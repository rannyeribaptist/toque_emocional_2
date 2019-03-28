class AddSchoolIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :school, foreign_key: true
  end
end
