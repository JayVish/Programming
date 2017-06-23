#!/usr/bin/ruby
require 'json'
require 'net/http'
#puts JSON.parse(system 'curl -H "user_token: G7JtzUbXTMJx8xWizgDa" http://btc42.42.us.org/value.json\?user_token=G7JtzUbXTMJx8xWizgDa')
#system 'echo "system 'curl -H "user_token: J2789xo6s_GUaUL1sdb9" http://btc42.42.us.org/value.json\?user_token=G7JtzUbXTMJx8xWizgDa'" > datahold.txt'
system 'curl -s "user_token: J2789xo6s_GUaUL1sdb9" http://btc42.42.us.org/value.json\?user_token=G7JtzUbXTMJx8xWizgDa > datahold.json'
file = File.read('datahold.json')
data_hash = JSON.parse(file)
puts "Current price: #{data_hash["current"]}"
#Clears file
File.open('/nfs/2017/j/jvishwar/42final/Day04/datahold.json', 'w') {|file| file.truncate(0) }
#puts JSON.parse(response)
#puts "#{a}"
=begin
account=a["money_dollar"]
put account
#system 'curl -H "user_token: G7JtzUbXTMJx8xWizgDa" http://btc42.42.us.org/value.json\?user_token=G7JtzUbXTMJx8xWizgDa'
=end
