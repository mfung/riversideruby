class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
  property :password_hashed, String
  property :password_salt, String
  property :name, String
  property :created_at, DateTime
    
  attr_accessor :password
  
  def json(*a)
    {
      'id'              => self.id,
      'email'           => self.email,
      'name'            => self.name,
      'created_at'      => self.created_at
    }.to_json(*a)
  end
  
end

DataMapper.finalize
DataMapper.auto_upgrade!

## users
get '/users' do
end

get '/users/:id' do |id|
  content_type :json
  user = User.get(params[:id]) 
  if user
    user.json
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
      user.json
    else
      error 400, user.errors.to_json
    end
  rescue => e
    error 400, e.message.to_json
  end
end

get '/users/:id/edit' do |id|
  content_type :json
  user = User.get(params[:id]) 
  if user
    user.json
  else
    error 404, {:error => "user not found"}.to_json 
  end
end

put '/users/:id/update' do |id|
  content_type :json
  user = User.get(params[:id])
  if user
    begin
      if user.update(JSON.parse(request.body.read)) 
        user.json
      else
        error 400, e.message.to_json
      end
    rescue => e
      error 400, e.message.to_json
    end
  else
    error 404, "user not found".to_json
  end
end 

post 'users/:id/destroy' do |id|
end
## end users