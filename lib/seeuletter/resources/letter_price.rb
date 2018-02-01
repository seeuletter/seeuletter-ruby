require "seeuletter/resources/resource_base"

module Seeuletter
  module Resources
    class LetterPrice < Seeuletter::Resources::ResourceBase
      def initialize(config)
        super(config)
        @endpoint = "price/letter"
      end

      alias get list
    end
  end
end
