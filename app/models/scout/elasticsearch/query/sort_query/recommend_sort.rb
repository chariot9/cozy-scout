module Scout
  module Elasticsearch
    class Query
      module SortQuery
        class RecommendSort

          def initialize(config)
            @config = config
          end

          def score_query
            {
              function_score: {
                score_mode: :sum,
                boost_mode: :sum,
                functions: score_query_functions,
              }
            }
          end

          def sort_query
            [{ _score: :desc }]
          end

          def score_query_functions
            # TODO
          end
        end
      end
    end
  end
end
