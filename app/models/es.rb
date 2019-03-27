class ES

  def self.client
    Thread.current[:ES_client] ||= Elasticsearch::Client.new(url: ES.url, log: true)
  end

  def self.url
    ENV['ELASTICSEARCH_URL']
  end

  def self.index_name
    ENV['ELASTICSEARCH_INDEX_NAME']
  end

  def self.index_type
    ENV['ELASTICSEARCH_INDEX_TYPE']
  end
end
