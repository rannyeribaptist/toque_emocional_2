class AddSchoolToOccurrency < ActiveRecord::Migration[5.2]
  def change
    add_reference :occurrencies, :school, foreign_key: true
  end
end
