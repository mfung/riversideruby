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

get '/stylesheet.css' do
  sass :"stylesheets/stylesheet", :style => :compact
end

# =end SASS StyleSheets