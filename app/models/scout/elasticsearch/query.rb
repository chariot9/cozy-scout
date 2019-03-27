module Scout
  module Elasticsearch
    class Query

      attr_reader :config

      def initialize(config)
        @config = config
      end

      def query
        # TODO chagne config here
        {
          size: 5,
          from: 0,
          # fields: [],
          # filter: base_filter_query.query,
          sort: recommend_sort_query.sort_query
        }
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
