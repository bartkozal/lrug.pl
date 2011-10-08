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
  task :restart do
    thin.restart
  end

  task :link do
    %w(basic_auth omniauth database thin).each do |filename|
      run "ln -nfs #{shared_path}/config/#{filename}.yml #{latest_release}/config/#{filename}.yml"
    end
  end

  namespace :thin do
    %w(start stop restart).each do |action|
      task action do
        run "cd #{latest_release} && bundle exec thin #{action} -C #{latest_release}/config/thin.yml"
      end
    end
  end
end
