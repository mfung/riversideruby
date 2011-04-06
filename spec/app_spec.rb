require File.dirname(__FILE__) + '/spec_helper'

describe "Riverside Ruby" do
  include Rack::Test::Methods
  
  def app
    @app ||= Sinatra::Application
  end
  
  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
end

######################################################
# User Authentication
######################################################

describe "Users" do
  include Rack::Test::Methods
  
  before(:each) do
      User.destroy
      post '/users/create', {
          :name     => "Meng Fung",
          :email    => "me@mengfung.com",
          :password => "superPassword"}.to_json
      user = JSON.parse(last_response.body)
      @user_id = user['id']
  end
    
  def app
    @app ||= Sinatra::Application
  end
  
  describe "POST on /users/create" do
    it "should create a user" do
      last_response.should be_ok, last_response.body
      
      get "/users/#{@user_id}"
      attributes = JSON.parse(last_response.body)
      attributes['name'].should  == "Meng Fung"
      attributes['email'].should == "me@mengfung.com"
    end
  end
  
  describe "GET on /users/:id" do
    it "should return a user by id" do
      get "/users/#{@user_id}"
      attributes = JSON.parse(last_response.body)
      attributes['name'].should == "Meng Fung"
      attributes['email'].should == "me@mengfung.com"
    end
  end
  
  describe "GET on /users/:id/edit" do
    it "should return a user by id for edit" do
      get "/users/#{@user_id}/edit"
      attributes = JSON.parse(last_response.body)
      attributes['name'].should  == "Meng Fung"
      attributes['email'].should  == "me@mengfung.com"
    end
  end
  
  describe "PUT on /users/:id/update" do
    it "should update a users information" do
      put "/users/#{@user_id}/update", {:name => "Meng Fung V2.0", :email => "me2@mengfung.com"}.to_json
      last_response.should be_ok, last_response.body
      
      get "/users/#{@user_id}/edit"
      attributes = JSON.parse(last_response.body)
      attributes['name'].should  == "Meng Fung V2.0"
      attributes['email'].should  == "me2@mengfung.com"
    end
  end
end

describe "Sessions" do
  
end