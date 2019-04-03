module Api
  module V1
    class PostsController < ApplicationController

      # TODO(trung) Add more params here
      BASIC_PARAMS = [
        :keyword
      ]

      def index
        client = Elasticsearch::Client.new log: true
        data = client.get index: 'posts_development_20190323022602825', type: 'post', id: 5
        render json: { status: 'SUCCESS', message: 'loaded posts', data: data }
      end

      def show
        query = search_params
        options = search_options(per: 2, page: 1)
        results = Scout::Search.fetch(query, options)
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
        params
          .permit(BASIC_PARAMS)
      end
    end
  end
end
