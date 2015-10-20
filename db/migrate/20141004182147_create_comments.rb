class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author
      t.integer :target
      t.text :contents

      t.timestamps
    end
  end
end
