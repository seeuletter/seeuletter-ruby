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

    if list_response['invoices'].count > 0
        # get single invoice by API
        find_response = seeuletter.invoices.find(list_response['invoices'][0]['_id'])
        puts "The Seeuletter API Invoice responded : #{find_response}"
    else
        # no invoice to get by API
        puts "No invoice can be found"
    end

rescue Seeuletter::SeeuletterError => ex
    puts "Error from API : #{ex}"
end
