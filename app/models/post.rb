class Post < ActiveRecord::Base
  validates_presence_of :content, :title
  default_scope -> { order('created_at DESC') }
  default_scope -> { where("private = ?", false) }
end
