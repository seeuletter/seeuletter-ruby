$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts seeuletter.users.create_from_api(email: 'email@example.com', name: 'Example')
