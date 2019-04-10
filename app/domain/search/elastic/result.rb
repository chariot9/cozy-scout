module Search
  module Elastic
    class Result
      def initialize(response, config)
        @response = response
        @config = config
        map_data
      end

      def data
        data = Search::Elastic::Data.new(@total_count,
                                               @company_ids,
                                               @scores,
                                               @config.options,
                                               @explains)
        Search::Elastic::Export::JsonExporterStrategy.new.export(data)
      end

      private

      def map_data
        @total_count = @response['hits']['total'].to_i
        hits = @response['hits']['hits']
        @company_ids = hits.map { |u| u['_id'].to_i }
        @scores = hits.map { |u| u['_score'].to_f }
        @explains = hits.map { |u| u['_explanation'] || {} }
      end
    end
  end
end
