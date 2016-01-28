class AddDoneReadingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :done_reading, :boolean, default: false 
  end
end
