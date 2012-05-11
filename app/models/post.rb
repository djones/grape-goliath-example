class Post < ActiveRecord::Base
  
  validates :title, :presence => true
  
end