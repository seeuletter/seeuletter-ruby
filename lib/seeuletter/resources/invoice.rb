require "seeuletter/resources/resource_base"

module Seeuletter
  module Resources
    class Invoice < Seeuletter::Resources::ResourceBase

      def initialize(config)
        super(config)
        @endpoint = "invoices"
      end

      def create(options={}, headers={})
        raise SeeuletterError.new("Invalid REST operation : POST /invoices", "404", nil)
      end

      def destroy(resource_id)
        raise SeeuletterError.new("Invalid REST operation : DELETE /accounts/:invoice_id", "404", nil)
      end

    end
  end
end
