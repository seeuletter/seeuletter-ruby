# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

html = %(
<html>
<head>
<style>
  *, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }
  .text {
    margin-left: 50px;
    padding-top: 450px;
    font-size: 50px;
    font-weight: 700;
  }
</style>
</head>

<body>
  <p class="text">Hello {{name}}!</p>
</body>

</html>
)

# list all postcards sent
puts seeuletter.postcards.list

# send a dummy the letter
puts seeuletter.postcards.create(
  description: 'Test letter from the Ruby Wrapper',
  to: {
    name: 'Erlich',
    address_line1: '30 rue de rivoli',
    address_line2: '',
    address_city: 'Paris',
    address_country: 'France',
    address_postalcode: '75004'
  },
  source_file_front: html,
  source_file_front_type: 'html',
  source_file_back: html,
  source_file_back_type: 'html',
  variables: { name: 'Erlich' }
)
