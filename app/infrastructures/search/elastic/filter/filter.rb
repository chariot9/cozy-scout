module Search
  module Elastic
    module Filter
      class Filter

        ACTIVE_SIGN = ['Active', 'ACT']
        DELETED_COMPANY_SIGN = 'D'

        attr_reader :config

        def initialize(config)
          @config = config
        end

        def query
          filters = []

          filters << active_companies

          filters << existing_companies

          filters << match

          {
            and: filters
          }
        end

        private

        # Filter only active companies
        def active_companies
          {
            bool: {
              must_not: {
                term: {
                  enterprise_status_id: ACTIVE_SIGN
                }
              }
            }
          }
        end

        # Filter only the existing company (not marked as deleted)
        def existing_companies
          {
            not: {
              term: {
                action_code: DELETED_COMPANY_SIGN
              }
            }
          }
        end

        # Match search keyword in company_name_vn
        def match
          {
            query: {
              multi_match: {
                query: config.query[:keyword],
                fields: ["company_name_vn", "company_name_en", "website", "registered_address_vn", "registered_address_en", "company_type"]
              }
            }
          }
        end
      end
    end
  end
end
