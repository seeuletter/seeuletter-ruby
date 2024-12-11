# seeuletter-ruby


[![Gem Version](https://badge.fury.io/rb/seeuletter.svg)](https://badge.fury.io/rb/seeuletter)
[![Dependency Status](https://gemnasium.com/badges/github.com/seeuletter/seeuletter-ruby.svg)](https://gemnasium.com/github.com/seeuletter/seeuletter-ruby)


Ruby wrapper for the [Seeuletter.com](https://www.seeuletter.com) API. See the full Seeuletter.com [API Documentation](https://docs.seeuletter.com/?ruby#).  For best results, be sure that you're using the latest version of the Seeuletter API and the latest version of the ruby wrapper. This gem gives you an ActiveRecord-style syntax to use the Seeuletter.com API.

Supports Ruby 2.0.0 and greater.

## Table of Contents

- [Getting Started](#getting-started)
  - [Registration](#registration)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Letters](#letters)
  - [Accounts](#accounts)
  - [Invoices](#invoices)
- [Examples](#examples)

## Getting Started

Here's a general overview of the Seeuletter services available, click through to read more.

Please read through the official [API Documentation](https://docs.seeuletter.com/?ruby#) to get a complete sense of what to expect from each endpoint.

### Registration

First, you will need to first create an account at [Seeuletter.com](https://www.seeuletter.com/signup) and obtain your Test and Live API Keys.

Once you have created an account, you can access your API Keys from the [API Keys Panel](https://www.seeuletter.com/app/dashboard/keys).

### Installation

Add this line to your application's `Gemfile`:

    gem 'seeuletter'

And then execute:

    $ bundle

Or manually install it yourself:

    $ gem install seeuletter

### Usage

The library uses an ActiveRecord-style interface.

For optional parameters and other details, refer to the docs [here](https://docs.seeuletter.com/?ruby#).

#### Initialization and Configuration

```ruby
# To initialize a Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: "your-api-key")
```

```ruby
# To initialize a Seeuletter object configured with non default host api
seeuletter = Seeuletter::Client.new(api_key: "your-api-key", host: "127.0.0.1")
```

### Letters

#### Create a new letter

```ruby
# send the letter
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

puts seeuletter.letters.create(
  description: "Test letter from the Ruby Wrapper",
  to: {
    name: 'Erlich',
    address_line1: '30 rue de rivoli',
    address_line2: '',
    address_city: 'Paris',
    address_country: 'France',
    address_postalcode: '75004'
  },
  source_file: '<html>Hello {{name}}</html>',
  source_file_type: 'html',
  postage_type: 'prioritaire',
  variables: { name: 'Erlich'},
  color: 'color'
)
```

#### Create a new electronic letter

```ruby
# send the letter
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: '<PUT_YOU_API_KEY_HERE>')

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
```

#### List all letters

```ruby
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

puts seeuletter.letters.list()
```

#### Get a specific letter

```ruby
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

puts seeuletter.letters.find('LETTER_ID')
```
#### Get the price of a letter

```ruby
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

puts seeuletter.letter_price.get(color: 'bw', postage_type: 'prioritaire', postage_speed: 'D1', page_count: 1)
```

### Accounts

#### Create a new account for the company

```ruby
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

puts seeuletter.accounts.create(
  email: "msb.partner@example.com",
  name: "Erlich Bachman",
  phone: "+33104050607",
  company_name: "MSB Partner from Ruby Wrapper",
  address_line1: '30 rue de rivoli',
  address_line2: '',
  address_city: 'Paris',
  address_country: 'France',
  address_postalcode: '75004'
)
```

### Update the account company email

```ruby
require 'seeuletter'

# initialize Seeuletter object
seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

seeuletter.accounts.updateEmail('ACCOUNT_COMPANY_ID', "msb.partner.new@example.com")
```



### Invoices

#### List all invoices for a company

```ruby
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

puts seeuletter.invoices.list()
```

#### Get a specific invoice

```ruby
require 'seeuletter'

seeuletter = Seeuletter::Client.new(api_key: 'test_12345678901234567890')

puts seeuletter.invoices.find('INVOICE_ID')
```

#### Caution: Pass zero-prefixed postal codes as strings

When using postal codes with zero-prefixes, always quote them. For example when specifying `02125`, pass it as a string `"02125"`, instead of an integer.

The Ruby interpreter assumes it's not of base-10 and tries to convert it to base-10 number. So that might result in an entirely different postal code than intended.

#### Accessing Response Headers

You can access response headers via a hidden `headers` method on the response hash.

```ruby
addresses = seeuletter.addresses.list

addresses._response.headers[:content_type]
# => "application/json"
```


## Examples

We've provided various examples for you to try out [here](https://github.com/seeuletter/seeuletter-ruby/tree/master/examples).

There are simple scripts to demonstrate how to create all letters with the Seeuletter API Ruby wrapper.

=======================

Copyright &copy; 2024 Seeuletter.com

Released under the MIT License, which can be found in the repository in `LICENSE.txt`.
