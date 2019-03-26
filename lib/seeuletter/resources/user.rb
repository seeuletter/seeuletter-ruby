require "seeuletter/resources/resource_base"

module Seeuletter
  module Resources
    class User < Seeuletter::Resources::ResourceBase
      def initialize(config)
        super(config)
        @endpoint = "users"
      end

      def create_from_api(options={}, headers={})
        submit :post, "#{endpoint_url}/create_from_api", options, headers
      end
    end
  end
end
