module Search
  module Elastic
    module Export

      # Strategy pattern
      class ExporterStrategy

        def export(data)
          raise "Interface method"
        end
      end
    end
  end
end
