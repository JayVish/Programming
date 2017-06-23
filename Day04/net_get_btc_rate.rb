#!/usr/bin/ruby
require 'json'
require 'net/http'
require 'uri'

uri = URI.parse("http://btc42.42.us.org/value.json\?user_token=J2789xo6s_GUaUL1sdb9")
values= JSON.parse(Net::HTTP.get(uri))
puts "Current price: #{values["current"]}"
