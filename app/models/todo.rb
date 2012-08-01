class Todo < ActiveRecord::Base
  attr_accessible :body, :done, :due, :category
  after_initialize :default_values

  belongs_to :user

  validates :body, presence: true
  
  private
    def default_values
      self.done ||= false
    end


end
