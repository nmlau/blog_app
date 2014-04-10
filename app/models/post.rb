class Post < ActiveRecord::Base
  validates_presence_of :content, :title
  default_scope -> { order('created_at DESC') }
end
