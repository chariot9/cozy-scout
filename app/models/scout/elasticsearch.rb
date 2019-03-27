module Scout
  module Elasticsearch
    class << self
      def fetch(query, options)
        Scout::Elasticsearch::Engine.new(query, options).fetch
      end
    end
  end
end
