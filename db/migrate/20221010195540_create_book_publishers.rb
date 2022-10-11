class CreateBookPublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :book_publishers do |t|
      t.belongs_to :book
      t.belongs_to :publisher

      t.timestamps
    end
  end
end
