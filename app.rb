require 'rubygems'

require 'bundler'
Bundler.setup

require 'sinatra'
require 'haml'
require 'sass'
require 'rmeetup'
require 'time'

before '/' do
  RMeetup::Client.api_key = "6b47764419734b346f14506a444f302a"
  @meetup = RMeetup::Client.fetch(:events,{:group_urlname => "riversideruby",:before => '1m'}).first.event
end

get '/' do
  haml :layout
end

# =start SASS StyleSheets

get '/css/stylesheet-expanded.css' do
  sass :"stylesheets/stylesheet", :style => :expanded
end

get '/css/stylesheet.css' do
  sass :"stylesheets/stylesheet", :style => :compressed
end

# =end SASS StyleSheets