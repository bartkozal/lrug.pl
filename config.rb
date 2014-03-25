activate :livereload
activate :autoprefixer

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.strategy = :force_push
end
