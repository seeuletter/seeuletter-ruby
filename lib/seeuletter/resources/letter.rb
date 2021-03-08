require "seeuletter/resources/resource_base"

module Seeuletter
  module Resources
    class Letter < Seeuletter::Resources::ResourceBase

        def initialize(config)
            super(config)
            @endpoint = "letters"
        end

        def createElectronic(options={}, headers={})
            submit :post, resource_url("electronic"), options, headers
        end
    end
  end
end
