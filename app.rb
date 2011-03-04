require 'rubygems'

require 'bundler'
Bundler.setup

require 'sinatra'
require 'haml'
require 'sass'

get '/stylesheet.css' do
  sass :"stylesheets/stylesheet", :style => :compact
end

get '/' do
  haml :index
end