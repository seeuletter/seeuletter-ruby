require "seeuletter/resources/letter"

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

  end
end
