module Search
  module Elastic
    class Engine

      attr_reader :config

      def initialize(query, options)
        @config = Search::Elastic::Config::ElasticConfig.new(query, options)
      end

      def fetch
        es_filter = Search::Elastic::Filter::Filter.new(config)
        es_sorter = Search::Elastic::Sort::Sorter.new(config)
        es_query = Search::Elastic::Query::Query.new(config).query(es_filter, es_sorter)

        response = Search::Elastic::Request::Requestor.new(es_query, config).request
        Search::Elastic::Result.new(response, config).data
      end
    end
  end
end
