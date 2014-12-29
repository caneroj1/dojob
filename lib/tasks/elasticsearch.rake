namespace :elasticsearch do
  desc "Starts elasticsearch server"
  task :start do
    `elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml`
  end

  task :reindex_jobs do
    `curl -XPOST "http://localhost:9200/jobs" -d'
    {
      "user_id" : "1",
      "id" : 1,
      "title" : "Elasticsearch Test",
      "description" : "Trying out elasticsearch reindexing"
    }'
    `
  end
end
