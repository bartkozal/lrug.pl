desc 'Dump the database from production'
namespace :db do
  task :fetch do
    system 'scp bkzl@sandbox.carriles.pl:/home/wijet-web/lrug/shared/db/production.sqlite3 ./db/development.sqlite3'
  end
end
