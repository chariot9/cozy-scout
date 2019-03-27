module Scout
  module Search
    class << self
      def fetch(query, options)
        Scout::Elasticsearch.fetch(query, options)
      end
    end
  end
end
