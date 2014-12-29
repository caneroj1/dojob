namespace :faye do
  desc "Start the faye server"
  task :start do
    `rackup -s thin -E production faye.ru`
  end

end
