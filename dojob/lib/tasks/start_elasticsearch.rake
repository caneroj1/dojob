namespace :elasticsearch do
  desc "Starts elasticsearch server"
  task :start do
    `elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml`
  end
end
