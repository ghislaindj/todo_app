class DropTable < ActiveRecord::Migration
  def up
  	drop_table :posts
  	drop_table :categories
  end

  def down
  	create_table :posts
  	create_table :categories
  end
end
