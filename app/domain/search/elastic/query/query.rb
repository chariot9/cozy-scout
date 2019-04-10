module Search
  module Elastic
    module Query
      class Query
        attr_reader :config

        def initialize(config)
          @config = config
        end

        def query(filter, sort)
          {
            size: 5,
            from: 0,
            fields: [],
            filter: filter.query,
            sort: sort.sort,
            query: sort.function_score
          }
        end
      end
    end
  end
end
