#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require 'json'
require 'whois'
require 'optparse'

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
  options = {}
  option_parser = OptionParser.new do |opts|
    executable_name = File.basename($PROGRAM_NAME)
    opts.banner = "Usage: #{executable_name} [options] <domain | IPv4 | IPv6>"
    opts.version = "v0.1.0"
  end
  option_parser.parse!
  if ARGV.empty?
    $stderr.puts "You must supply a fully qualified domain or IPv4 or IPv6 address."
    $stderr.puts
    $stderr.puts option_parser.help
    exit 64
  end

  results = Whois.query(ARGV[0])
  response = {}
  response["response"] = {}
  response["response"]["daystamp"] = Date.today
  response["response"]["properties"] = results.properties

  puts response.to_json
end
