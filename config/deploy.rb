$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'capistrano_colors'
require 'rvm/capistrano'
require 'bundler/capistrano'
set :rvm_ruby_string, 'ruby-1.9.2-p290@lrug'
set :rvm_type, :user

set :application, "lrug"
set :user, "wijet-web"
set :deploy_to, "/home/wijet-web/lrug"
set :domain, "#{application}.pl"

set :scm, :git
set :repository, "git://github.com/bkzl/lrug.pl.git"
set :branch, "master"
set :use_sudo, false

role :web, domain

after "deploy:finalize_update", "deploy:link"

namespace :deploy do
  task :link do
    run "ln -nfs #{shared_path}/config/basic_auth.yml #{latest_release}/config/basic_auth.yml"
    run "ln -nfs #{shared_path}/config/omniauth.yml #{latest_release}/config/omniauth.yml"
  end

  task :restart do
    thin.stop
    thin.start
  end

  namespace :thin do
    task :start do
      run "cd #{latest_release} && bundle exec thin start -d -c #{latest_release} -p 8989 -e production -P tmp/pids/thin.pid"
    end

    task :stop do
      run "cd #{latest_release} && bundle exec thin stop -P tmp/pids/thin.pid"
    end
  end
end
