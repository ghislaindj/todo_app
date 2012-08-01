class AddCategory < ActiveRecord::Migration
  def up
  	add_column :todos, :category, :string

  end

  def down
  	remove_column :todos, :category
  end
end
