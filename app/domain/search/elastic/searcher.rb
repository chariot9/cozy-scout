module Search
  module Elastic
    module Searcher
      class << self
        def fetch(query, options)
          Search::Elastic::Engine.new(query, options).fetch
        end
      end
    end
  end
end
