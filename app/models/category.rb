class Category < ActiveRecord::Base
  attr_accessible :id, :name, :user_id
  has_many :todos

  belongs_to :user


end
