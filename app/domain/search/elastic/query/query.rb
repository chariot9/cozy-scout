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
            query: sort.function_score,
            _source: ["company_id", "company_name_vn", "company_name_en", "website", "registered_address_vn", "registered_address_en", "company_type"]
          }
        end
      end
    end
  end
end
