class AddBooks < ActiveRecord::Migration
  def change
  	create_table :books do |t|
  		t.string :title
  		t.string :author
  		t.string :comment
  		t.string :genre
  		t.integer :rating
  		t.timestamps
  	end
  end
end
