module Scout
  module Elasticsearch
    class Request
      attr_reader :query, :config

      def initialize(query, config)
        @query = query
        @config = config
      end

      def request
        ES.client.search(
          index: ES.index_name,
          type: ES.index_type,
          body: query,
          explain: config.explain?
        )
      end
    end
  end
end
