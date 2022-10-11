class CreateBookSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :book_subjects do |t|
      t.belongs_to :book
      t.belongs_to :subject

      t.timestamps
    end
  end
end
