class Todo < ActiveRecord::Base
  attr_accessible :body, :done, :due, :title
  belongs_to :user
  

end
