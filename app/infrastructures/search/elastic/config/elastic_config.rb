module Search
  module Elastic
    module Config
      class ElasticConfig

        attr_reader :query, :options

        def initialize(query, options)
          @query = query
          @option = options
        end

        # TODO(Trung) More configurations
        def explain?
          false
        end
      end
    end
  end
end
