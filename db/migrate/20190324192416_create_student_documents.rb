class CreateStudentDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :student_documents do |t|
      t.string :name
      t.belongs_to :student, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
