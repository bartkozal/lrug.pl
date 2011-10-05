set :application, "lrug"
set :user, "wijet-web"
set :deploy_to, "/home/wijet-web/lrug"
set :domain, "#{application}.pl"

set :scm, :git
set :repository, "git@sandbox.wijet.pl:lrug.git"
set :branch, "master"
set :use_sudo, false

role :web, domain # Your HTTP server, Apache/etc
role :app, domain # This may be the same as your `Web` server
role :db, domain, :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
