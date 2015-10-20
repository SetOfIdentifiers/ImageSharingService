class AddRating < ActiveRecord::Migration
  def up
    add_column :images, :total_rating, :integer
	add_column :images, :number_of_raters, :integer
  end
  
  def down
	remove_column :images, :total_rating
	remove_column :images, :number_of_raters
  end

end
