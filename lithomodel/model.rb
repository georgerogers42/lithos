require 'datamapper'
DataMapper.setup(:default,"sqlite3://#{Dir.pwd}/blog.db")
class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
  belongs_to :user
end
class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :pass, String
  has n, :posts
  def self.authenticate(user,password)
    u = User.first(:name => user)
    u if u.pass == password
  end
end
DataMapper.finalize
DataMapper.auto_upgrade!
