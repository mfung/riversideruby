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
