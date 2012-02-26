require 'sinatra'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com',10019, :pool_size => 5, :timeout => 5)
MongoMapper.database = 'upward'
MongoMapper.database.authenticate('rootuser','rootpassword')

class Post
  include MongoMapper::Document
  key :wins, String
  key :lessons, String
  key :goals, String

  timestamps!
end

get '/' do
  @posts = Post.all
  erb :index
end

get '/posts' do
  @posts = Post.all
  erb :list
end

get '/posts/new' do
  erb :new
end

post '/posts/create' do
  @post = Post.new
  @post.wins = (params[:wins])
  @post.lessons = (params[:lessons])
  @post.goals = (params[:goals])

  if @post.save
    status 201
  else
    status 401
  end

  redirect '/posts'
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])

  erb :edit
end

