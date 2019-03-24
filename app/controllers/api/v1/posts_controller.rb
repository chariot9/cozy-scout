module Api
  module V1
    class PostsController < ApplicationController

      def index
        client = Elasticsearch::Client.new log: true
        data = client.get index: 'posts_development_20190323022602825', type: 'post', id: 5
        render json: {status: 'SUCCESS', message: 'loaded posts', data: data}
      end
    end
  end
end
