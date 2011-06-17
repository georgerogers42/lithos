require 'datamapper'
DataMapper.setup(:default,"sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end
Post.auto_migrate! unless Post.storage_exists?
