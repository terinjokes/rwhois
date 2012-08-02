#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require 'json'
require 'whois'

# From http://ruhe.tumblr.com/post/565540643/generate-json-from-ruby-struct
class Struct
  def to_map
    map = Hash.new
    self.members.each {|m| map[m] = self[m]}
    map
  end

  def to_json(*a)
    to_map.to_json(*a)
  end
end

if __FILE__ == $PROGRAM_NAME
  results = Whois.query(ARGV[0])
  response = {}
  response["response"] = {}
  response["response"]["daystamp"] = Date.today
  response["response"]["properties"] = results.properties

  puts response.to_json
end
