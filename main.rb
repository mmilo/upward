require 'sinatra'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com',10019, :pool_size => 5, :timeout => 5)
MongoMapper.database = 'upward'
MongoMapper.database.authenticate('rootuser','rootpassword')

class Post
  include MongoMapper::Document
  key :text, String
end

get '/' do
  @posts = Post.all
  erb :index
end

get '/posts' do
  @posts = Post.all
  erb :list
end

post '/posts/new' do
  post = Post.new
  post.text = (params[:text])

  if post.save
    status 201
  else
    status 401
  end

  redirect '/posts'
end

