Rails.application.config.middleware.use OmniAuth::Builder do
  config = YAML.load_file(File.join(Rails.root, 'config', 'omniauth.yml'))
  github = config[Rails.env]['github']

  provider :github, github['client_id'], github['secret']
end