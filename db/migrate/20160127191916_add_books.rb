class AddBooks < ActiveRecord::Migration
  def change
  	create_table table_name: :books do |t|
  		t.string :title
  		t.string :author
  		t.string :comment
  		t.string :genre
  		t.integer :rating
  		t.timestamps
  	end
  end
end
