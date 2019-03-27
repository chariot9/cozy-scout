module Scout
  module Elasticsearch
    class Engine

      attr_reader :config

      def initialize(query, options)
        @config = Scout::Elasticsearch::Config.new(query, options)
      end

      def fetch
        es_query = Query.new(config).query
        response = Request.new(es_query, config).request
        Result.new(response, config).result
      end
    end
  end
end
