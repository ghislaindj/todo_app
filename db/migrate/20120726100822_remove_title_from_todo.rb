class RemoveTitleFromTodo < ActiveRecord::Migration
  def up
  	remove_column :todos, :title
  end

  def down
  	add_column :todos, :title, :string
  end
end
