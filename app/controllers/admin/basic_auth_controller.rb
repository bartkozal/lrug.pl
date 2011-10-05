class Admin::BasicAuthController < ApplicationController
  basic_auth_config = YAML.load_file(File.join(Rails.root, 'config', 'basic_auth.yml'))
  http_basic_authenticate_with name: basic_auth_config[Rails.env]['name'], password: basic_auth_config[Rails.env]['password']
end