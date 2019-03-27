module Scout
  module Elasticsearch
    class Query
      module FilterQuery
        class BaseFilter

          def initialize(config)
            @config = config
          end

          def query
            filters = []

            filters << {
              match_all: {}
            }

            {
              and: filters
            }
          end
        end
      end
    end
  end
end
