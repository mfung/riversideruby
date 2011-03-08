require 'rubygems'

require 'bundler'
Bundler.setup

require 'sinatra'
require 'haml'
require 'sass'

get '/' do
  haml :index
end

# meetup api key 6b47764419734b346f14506a444f302a
# =start SASS StyleSheets

get '/css/stylesheet-expanded.css' do
  sass :"stylesheets/stylesheet", :style => :expanded
end

get '/css/stylesheet.css' do
  sass :"stylesheets/stylesheet", :style => :compressed
end

# =end SASS StyleSheets