class AddPhotosToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :photos, :binary
  end
end
