class ChangeDueToTodos < ActiveRecord::Migration
  def up
  	 change_column :todos, :due, :date
  end

  def down
  	  	 change_column :todos, :due, :datetime
  end
end
