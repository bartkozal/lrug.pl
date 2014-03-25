activate :livereload
activate :autoprefixer

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

helpers do
  def link_to_if(condition, caption)
    condition ? link_to(caption, condition) : caption
  end

  def current_event
    data.events.first
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.strategy = :force_push
end
