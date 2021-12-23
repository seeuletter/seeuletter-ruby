$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

begin
    # get list of invoices
    list_response = seeuletter.invoices.list(
        status: "paid",
        date_start: "2020-01-01"
    )
    puts "The Seeuletter API Invoices responded : #{list_response}"

    # get single invoice by API
    find_response = seeuletter.invoices.find(list_response['invoices'][0]['_id'])
    puts "The Seeuletter API Invoice responded : #{find_response}"

rescue Seeuletter::SeeuletterError => ex
    puts "Error from API : #{ex}"
end
