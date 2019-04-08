module Scout
  module Elasticsearch
    class Query

      attr_reader :config

      def initialize(config)
        @config = config
      end

      def query
        r = {
          size: 5,
          from: 0,
          fields: [],
          filter: base_filter_query.query,
          sort: recommend_sort_query.sort_query
        }

        # TODO(trung) Add score function later
        r.merge!(query: recommend_sort_query.score)
        r
      end

      private

      def base_filter_query
        FilterQuery::BaseFilter.new(config)
      end

      def recommend_sort_query
        SortQuery::RecommendSort.new(config)
      end
    end
  end
end
