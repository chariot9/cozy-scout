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

          def score
            {
              function_score: {
                score_mode: :sum,
                boost_mode: :sum,
                functions: score_query_functions,
              }
            }
          end

          def score_query_functions
            r = []
            r += Attractive.new.score_function
            # TODO(Trung): add more score scripts
            r
          end
        end
      end
    end
  end
end
