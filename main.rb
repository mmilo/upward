require 'sinatra'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com',10019, :pool_size => 5, :timeout => 5)
MongoMapper.database = 'upward'
MongoMapper.database.authenticate('rootuser','rootpassword')

get '/' do
  erb :index
end

