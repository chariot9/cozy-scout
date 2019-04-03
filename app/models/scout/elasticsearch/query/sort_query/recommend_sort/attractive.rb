module Scout
  module Elasticsearch
    class Query
      module SortQuery
        class RecommendSort
          class Attractive

            def score_function
              [
                {
                  script_score: {
                    params: {
                      weight: 300,
                    },
                    script: 'weight * number_of_empl'
                  }
                }
              ]
            end
          end
        end
      end
    end
  end
end
