class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.boolean :done
      t.datetime :due

      t.timestamps
    end
  end
end
