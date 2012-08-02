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
  options = {:output => :plaintext}
  option_parser = OptionParser.new do |opts|
    executable_name = File.basename($PROGRAM_NAME)
    opts.banner = "Usage: #{executable_name} [options] <domain | IPv4 | IPv6>"
    opts.version = "v0.2.0"
    opts.on("-a", "--availabile", "Information about the domain availablity (JSON)") do
      options[:output] = :available
    end
    opts.on("-r", "--record", "Raw WHOIS record for a domain (JSON)") do
      options[:output] = :record
    end
    opts.on("-p", "--parts", "WHOIS records without merging multiple responses (JSON)") do
      options[:output] = :parts
    end
    opts.on("-j", "--properties", "Parsed WHOIS record (JSON)") do
      options[:output] = :properties
    end
    opts.on("-t", "--plaintext", "Raw WHOIS record for a domain (largely whois(1) compatible)") do
      options[:output] = :plaintext
    end
  end
  option_parser.parse!
  if ARGV.empty?
    $stderr.puts "You must supply a fully qualified domain or IPv4 or IPv6 address."
    $stderr.puts
    $stderr.puts option_parser.help
    exit 64
  end

  results = Whois.query(ARGV[0])
  if options[:output] == :plaintext
    puts results
  else
    response = {}
    response["response"] = {}
    response["response"]["daystamp"] = Date.today
    case options[:output]
    when :available
      response["response"]["available"] = results.available?
      response["response"]["registered"] = results.registered?
    when :record
      response["response"]["record"] = results.content
    when :parts
      response["response"]["parts"] = results.parts
    else
      response["response"]["properties"] = results.properties
    end
    puts response.to_json
  end

end
