require 'rubygems'

require 'bundler'
Bundler.setup


require 'haml'
require 'sass'
require 'rmeetup'
require 'time'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-timestamps'
require 'sinatra'
require 'json'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/rruby.db")

## custom 
require "#{Dir.pwd}/models/users"

before '/' do
  RMeetup::Client.api_key = "6b47764419734b346f14506a444f302a"
  @meetup = RMeetup::Client.fetch(:events,{:group_urlname => "riversideruby",:before => '1m'}).first.event
end

get '/' do
  haml :layout
end

module Helpers
  def login_required
    
  end
  
  def current_user
    
  end
  
  def logged_in?
    
  end
end

## SASS StyleSheets

get '/css/stylesheet-expanded.css' do
  sass :"stylesheets/stylesheet", :style => :expanded
end

get '/css/stylesheet.css' do
  sass :"stylesheets/stylesheet", :style => :compressed
end

## end SASS StyleSheets