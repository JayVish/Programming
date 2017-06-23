#!/usr/bin/ruby
require 'json'
require 'net/http'
require 'uri'

def update_market
    uri = URI.parse("http://btc42.42.us.org/value.json\?user_token=J2789xo6s_GUaUL1sdb9")
    values= JSON.parse(Net::HTTP.get(uri))
    return values["money_dollar"], values["current"]
end

def make_transaction

end
#Buy and sell code
kind=""
if ARGV[0]=="sell"
    kind = "sell"
else
    kind = "buy"
end
#curl -H "Content-Type: application/json" -X POST -d '{"user_token":"G7JtzUbXTMJx8xWizgDa","btc_amount":"0","kind":"buy"}' http://btc42.42.us.org/exchange
urireturn = URI.parse("http://btc42.42.us.org/exchange")
btc_amount = ARGV[1]
user_input = {
    "user_token" => "J2789xo6s_GUaUL1sdb9",
    "btc_amount" => "#{btc_amount}",
    "kind" => "#{kind}"
}
Net::HTTP.post_form(urireturn, user_input)
values = JSON.parse(Net::HTTP.get(uri))
puts ("#{values["money_dollar"]} dollars")
puts ("#{values["money_btc"]} btc")