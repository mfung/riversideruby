class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
  property :password_hashed, String
  property :password_salt, String
  property :name, String
  property :description, Text
  
  property :created_at, DateTime
  
end

DataMapper.finalize
DataMapper.auto_upgrade!

## users
get '/users' do
end

get '/users/:id' do |id|
end

get '/users/new' do
end

post '/users/create' do
end

get '/users/:id/edit' do |id|
end

post 'users/:id/update' do |id|
end 

post 'users/:id/destroy' do |id|
end
## end users