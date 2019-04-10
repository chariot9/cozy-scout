module Search
  module Elastic
    module Request
      class Requestor
        attr_reader :query, :config

        def initialize(query, config)
          @query = query
          @config = config
        end

        def request
          Search::Elastic::Endpoint.client.search(
            index: Search::Elastic::Endpoint.index_name,
            type: Search::Elastic::Endpoint.index_type,
            body: query,
            explain: config.explain?
          )
        end
      end
    end
  end
end
