require "seeuletter/resources/resource_base"

module Seeuletter
  module Resources
    class Postcard < Seeuletter::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "postcards"
      end

    end
  end
end
