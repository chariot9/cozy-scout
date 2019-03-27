module Scout
  module Elasticsearch
    # Use this class to result data
    class Result

      def initialize(response, config)
        @response = response
        @config = config
        set_values
      end

      def result
        Data.new(
          total_count: @total_count,
          user_ids: @user_ids,
          scores: @scores,
          explains: @explains,
          options: @config.options
        ).to_h
      end

      private

      def set_values
        @total_count = @response['hits']['total'].to_i
        hits = @response['hits']['hits']
        @user_ids = hits.map { |u| u['_id'].to_i }
        @scores = hits.map { |u| u['_score'].to_f }
        @explains = hits.map { |u| u['_explanation'] || {} }
      end

      # Responded data is oriented by object
      class Data
        def initialize(total_count:, user_ids:, scores:, options:, explains:)
          @total_count = total_count
          @user_ids = user_ids
          @scores = scores
          @explains = explains
          @options = options
        end

        def to_h
          {
            total_count: @total_count,
            user_ids: @user_ids,
            scores: @scores,
            explains: @explains,
            options: @options,
          }
        end
      end
    end
  end
end
