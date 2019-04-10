module Api
  module V1
    # Search API endpoint
    class SearchController < ApplicationController

      # TODO(trung): Add more params here, only :keyword is available for now.
      # For searching, it should contains other options like location, number of employee range...
      BASIC_PARAMS = [
        :keyword
      ].freeze

      def index
        query = search_params
        options = search_options(per: 2, page: 1)
        results = Search::Elastic::Engine.new(query, options).fetch
        render json: results
      end

      private

      def search_options(per:, page:)
        {
          per: per,
          page: page
        }
      end

      def search_params
        params.permit(BASIC_PARAMS)
      end
    end
  end
end
