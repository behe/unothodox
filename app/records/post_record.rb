class PostRecord < ActiveRecord::Base
  self.table_name = :posts
  attr_accessible :id, :body, :title
end
