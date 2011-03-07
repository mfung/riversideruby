require 'rubygems'

require 'bundler'
Bundler.setup

require 'sinatra'
require 'haml'
require 'sass'

get '/' do
  haml :index
end

# =start SASS StyleSheets

get '/css/stylesheet.css' do
  sass :"stylesheets/stylesheet", :style => :expanded
end

# =end SASS StyleSheets