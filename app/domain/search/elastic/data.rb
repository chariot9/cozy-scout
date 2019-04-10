module Search
  module Elastic
    class Data

      attr_reader :total_count, :company_ids, :scores, :options, :explains

      def initialize(total_count, company_ids, scores, options, explains)
        @total_count = total_count
        @company_ids = company_ids
        @scores = scores
        @options = options
        @explains = explains
      end
    end
  end
end
