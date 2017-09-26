require "seeuletter/resources/resource_base"

module Seeuletter
  module Resources
    class Letter < Seeuletter::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "letters"
      end

    end
  end
end
