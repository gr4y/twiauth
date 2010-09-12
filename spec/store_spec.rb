require 'spec_helper'

describe TwiAuth::Store do

  before :all do
    @store = TwiAuth::Store.new
  end

  it "should store some data" do
    @store.put("test", "test-value")
  end

  it "should return some data" do
    @store.get("test").should.eql?("test-value")
  end

  it "should delete some data" do
    @store.delete("test")
    @store.get("test").should be_nil
  end

end