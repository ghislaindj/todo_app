class RemoveCategory < ActiveRecord::Migration
  def up
  	remove_column :todos, :category_id

  end

  def down
  	add_column :todos, :category_id, :integer
  end
end
