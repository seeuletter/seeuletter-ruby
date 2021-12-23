require "seeuletter/resources/letter"
require 'seeuletter/resources/letter_price'
require "seeuletter/resources/user"
require "seeuletter/resources/account"
require "seeuletter/resources/invoice"

module Seeuletter
  class Client

    attr_reader :config

    def initialize(config = nil)
      if config.nil? || config[:api_key].nil?
        raise ArgumentError.new(":api_key is a required argument to initialize Seeuletter")
      end

      @config = config
    end

    def letters
      Seeuletter::Resources::Letter.new(config)
    end

    def letter_price
      Seeuletter::Resources::LetterPrice.new(config)
    end

    def users
      Seeuletter::Resources::User.new(config)
    end

    def accounts
      Seeuletter::Resources::Account.new(config)
    end

    def invoices
      Seeuletter::Resources::Invoice.new(config)
    end
  end
end
