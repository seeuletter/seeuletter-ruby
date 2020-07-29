# frozen_string_literal: true

require 'seeuletter/resources/letter'
require 'seeuletter/resources/letter_price'
require 'seeuletter/resources/postcard'
require 'seeuletter/resources/user'

module Seeuletter
  class Client
    attr_reader :config

    def initialize(config = nil)
      if config.nil? || config[:api_key].nil?
        raise ArgumentError, ':api_key is a required argument to initialize Seeuletter'
      end

      @config = config
    end

    def letters
      Seeuletter::Resources::Letter.new(config)
    end

    def letter_price
      Seeuletter::Resources::LetterPrice.new(config)
    end

    def postcards
      Seeuletter::Resources::Postcard.new(config)
    end

    def users
      Seeuletter::Resources::User.new(config)
    end
  end
end
