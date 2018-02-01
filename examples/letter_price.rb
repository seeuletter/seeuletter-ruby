$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts seeuletter.letter_price.get(color: 'bw', postage_type: 'prioritaire', postage_speed: 'D1', page_count: 1)