module Search
  module Elastic
    module Sort
      class Sorter

        def initialize(config)
          @config = config
        end

        def function_score
          {
            function_score: {
              score_mode: :sum,
              boost_mode: :sum,
              functions: functions
            }
          }
        end

        def sort
          [{ _score: :desc }]
        end

        private

        def functions
          r = []
          r += Search::Elastic::Sort::Attractive.new.score_function
          r
        end
      end
    end
  end
end
