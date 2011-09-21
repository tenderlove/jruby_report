# encoding: UTF-8

require 'spec_helper'
require 'multi_json'

# there's 2 methods of changing MultiJson(the lib used by rails to handle json) engines.
# One is to require the lib directly and the other is to set MultiJson.engine =, but 
# the behavior is different for each one. Above each method I've put if it works of
# fails after testing using jruby 1.6.4 and mri 1.9.2p290

#pass in both
#require 'json/pure'
#fail only in jruby
#require 'yajl'
#fail in both
#require 'json'

require "multi_json/vendor/ok_json"

describe "MultiJson.engine" do

  #fail only in jruby
  #MultiJson.engine=:yajl
  #fail in both
  #MultiJson.engine=:ok_json
  #fail in both
  #MultiJson.engine=:json_pure
  #fail in both
  #MultiJson.engine=:json_gem
  
  puts MultiJson.engine
  
  it "should decode json even with special chars using a json string directly" do
    MultiJson.decode("{\"message\":\"á\"}")['message'].should eq "á"
  end

  it "should decode json even with special chars using to_json" do
    MultiJson.decode({:message => "á"}.to_json)['message'].should eq "á"
  end

  it "should decode json even with special chars using to_json" do
    MultiJson.encode({a:"á"}).should match /á/
  end
end