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
      @user_id = JSON.parse(last_response.body)["id"]
  end
    
  def app
    @app ||= Sinatra::Application
  end
  
  describe "POST on /users/create" do
    it "should create a user" do
      last_response.should be_ok, last_response.body
      
      get "/users/#{@user_id}"
      attributes = JSON.parse(last_response.body)
      attributes["name"].should  == "Meng Fung"
      attributes["email"].should == "me@mengfung.com"
    end
  end
  
  describe "PUT on /users/:id" do
    it "should edit a users information" do
      pending
    end
  end
  
  describe "GET on /users/:id/edit" do
    it "should display a users information" do
      get "/users/1/edit"
      attributes = JSON.parse(last_response.body)
      attributes["name"].should  == "Meng Fung"
      attributes["email"].should  == "me@mengfung.com"

    end
  end
  
end

describe "Sessions" do
  
end