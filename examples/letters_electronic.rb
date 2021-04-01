$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

html = %{
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
}


# send the letter
puts seeuletter.letters.createElectronic(
    description: "Test electronic letter from the Ruby Wrapper",
    to: {
        email: 'erlich.dumas@example.com',
        first_name: 'Erlich',
        last_name: 'Dumas',
        status: 'individual'
    },
    source_file: '<html>Hello {{name}}</html>',
    source_file_type: 'html',
    postage_type: 'lre',
    variables: {
        name: 'Erlich'
    }
)
