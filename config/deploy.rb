load 'deploy/assets'

require 'bundler/capistrano'
require 'rvm/capistrano'

default_run_options[:pty] = true

set :application, 'kittenstore'
set :repository, 'git@github.com:squil/kittenstore.git'
set :scm, :git
set :branch, 'master'
set :deploy_to, "/home/#{application}/apps/#{application}"
set :user, application
set :use_sudo, false

set :ssh_options, { :forward_agent => true }

server "178.79.166.22", :app, :web, :db, :primary => true

set :rvm_ruby_string, '2.0.0'
set :rvm_type, :system

after 'deploy:setup', 'deploy:set_rvm_version'
after 'deploy:finalize_update', 'symlink_config'

task :symlink_config, :roles => :app do
  %w(database.yml).each do |file|
    run "ln -s #{File.join(shared_path, 'config', file)} #{File.join(release_path, 'config', file)}"
  end
end
# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart, :roles => :app do
    run "sudo restart #{application} || exit 0"
  end
end
