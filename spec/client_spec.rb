require 'spec_helper'

describe TwiAuth::Client do

  before :all do
    @client = TwiAuth::Client.new(@consumer, @options)
    @session = Capybara::Session.new(:akephalos)
  end
    
  it 'should not be nil' do
    @client.should_not be_nil
  end
  
  it 'should have an method called get_request_token' do
    (@client.public_methods.include?(:get_request_token)).should be_true
  end

  it 'should get an request_token' do
    @client.get_request_token.should_not be_nil
  end

  it 'visits the authorize url' do
    @session.visit(@client.get_request_token.authorize_url)
  end
    
  it 'has an signin form' do
    @session.has_selector?('div#signin_form').should be_true
  end
    
  it 'fills out the form' do
    @session.within('#signin_form') do
      @session.fill_in 'username_or_email', :with => @test['user']
      @session.fill_in 'password', :with => @test['password']
    end
  end
  
  it 'has an allow button' do
    @session.has_button?('allow').should be_true
  end
  
  it 'clicks the allow botton' do
    @session.click_button('allow')
  end

  it 'should get an access_token' do
    oauth_pin = @session.find_by_id('oauth_pin')    
    pin = oauth_pin.text.chomp!
    @client.get_access_token(pin).should_not be_nil
  end

  it 'should have an public get method' do
    (@client.public_methods.include? :get).should be_true
  end

  it "should get an ok" do
    response = @client.get('/1/help/test.json')
    response.should_not be_nil
    response.should == "ok"
  end
  
  it 'should have an public post method' do
    (@client.public_methods.include? :post).should be_true
  end
  
  it "should post and delete a status" do
    response = @client.post("/1/statuses/update.json", {:status => 'test status'})
    response.should_not be_nil
    destroy_response = @client.post("/1/statuses/destroy/#{response['id']}.json")
    destroy_response.should_not be_nil
  end
  
end