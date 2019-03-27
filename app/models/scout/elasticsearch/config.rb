module Scout
  module Elasticsearch
    class Config

      attr_reader :query, :options

      include Flags

      def initialize(query, options)
        @query = query
        @option = options
      end
    end
  end
end
