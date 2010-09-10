require 'spec_helper'

describe TwiAuth::OAuth do

  before :all do
    pull_config
    @oauth = TwiAuth::OAuth.new(@oauth_key, @oauth_secret)
  end

  it "should be not nil" do
    @oauth.should_not be_nil
  end

  it "should get an ok" do
    @oauth.get("/1/help/test.json").eql?("ok")
  end

  it "should post and delete a status" do
    response = @oauth.post("/1/statuses/update.json", {:status => 'test status'})
    json = parse_json(response.body)
    @oauth.get("/1/statuses/destroy/#{json['id']}.json")
  end

end