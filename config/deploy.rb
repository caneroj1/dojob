# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'dojob'
set :repo_url, 'https://github.com/caneroj1/dojob.git'

# Default branch is :master
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/ubuntu/site/dojob'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# HOOKS
desc "Update the gems. Runs bundle:update"
task :bundle do
  on roles(:app) do
    run "bundle update"
  end
end

# update the bundle
after("deploy", "bundle")

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc "Check that we can access everything. This checks the server to see if deploy user has write permissions."
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end

  desc "Deploy with migrations. Invokes the deploy task and then runs the migrations."
  task :migrations do
    Capistrano::Application.invoke("deploy")
    run "rake db:migrate"
  end
end
