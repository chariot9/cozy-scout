module Search
  module Elastic
    module Export
      class JsonExporterStrategy < Search::Elastic::Export::ExporterStrategy

        def export(data)
          {
            total_count: data.total_count,
            company_ids: data.company_ids,
            company_names: data.company_names,
            scores: data.scores,
            explains: data.explains,
            options: data.options
          }
        end
      end
    end
  end
end
