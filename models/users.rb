class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
  property :password_hashed, String
  property :password_salt, String
  property :name, String
  property :description, Text
  property :created_at, DateTime
    
  attr_accessor :password
  
end

DataMapper.finalize
DataMapper.auto_upgrade!

## users
get '/users' do
end

get '/users/:id' do |id|
  content_type :text
  user = User.find(params[:id]) 
  if user
    puts user
  else
    error 404, {:error => "user not found"}.to_json 
  end
end

get '/users/new' do
end

post '/users/create' do
  content_type :json
  begin
    user = User.new(JSON.parse(request.body.read))
    if user.save
      user.to_json
    else
      error 400, user.errors.to_json
    end
  rescue => e
    error 400, e.message.to_json
  end
end

get '/users/:id/edit' do |id|
  content_type :json
  {:id => 1, :name => "Meng Fung",:email => "me@mengfung.com",:password => "superPassword",:password_confirmation => "superPassword"}.to_json
end

post 'users/:id/update' do |id|
end 

post 'users/:id/destroy' do |id|
end
## end users