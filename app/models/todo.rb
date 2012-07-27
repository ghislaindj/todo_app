class Todo < ActiveRecord::Base
  attr_accessible :body, :done, :due, :title, :category_id
  after_initialize :default_values

  belongs_to :user
  belongs_to :category

  validates :body, presence: true
  
  private
    def default_values
      self.done ||= false
    end


end
