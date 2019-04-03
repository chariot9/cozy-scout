module Scout
  module Elasticsearch
    class Query
      module FilterQuery
        class BaseFilter

          ACTIVE_SIGN = ['Active', 'ACT']
          DELETED_COMPANY_SIGN = 'D'

          attr_reader :config

          def initialize(config)
            @config = config
          end

          def query
            filters = []

            # filters << active_companies

            # filters << existing_companies

            # filters << num_of_employee

            filters << test

            {
              and: filters
            }
          end

          private

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

          def existing_companies
            {
              not: {
                term: {
                  action_code: DELETED_COMPANY_SIGN
                }
              }
            }
          end

          def num_of_employee
            {
              bool: {
                must_not: {
                  bool: {
                    must: [
                      {
                        range: {
                          number_of_empl: {
                            gte: 10
                          }
                        }
                      }
                    ]
                  }
                }
              }
            }
          end

          def test
            {
              query: {
                "match": {
                  "company_name_vn": config.query[:keyword]
                }
              }
            }
          end
        end
      end
    end
  end
end
