class Addcontent < ActiveRecord::Migration
  def up
    add_column :images, :content_type, :string
  end
  
  def down
  end
  
end
