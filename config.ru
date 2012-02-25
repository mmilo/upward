require 'rubygems'
require 'bundler'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'

Bundler.setup

require './main'
run Sinatra::Application