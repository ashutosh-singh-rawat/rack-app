# app_files = File.expand_path('../app/**/*.rb', __FILE__)
# Dir.glob(app_files).each { |file| require(file) }

require 'active_record'
require_relative './app/models/user'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), 'config', 'db.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration["development"])

app_files = File.expand_path('../app/**/*.rb', __FILE__)
Dir.glob(app_files).each { |file| require(file) }
require './config/router'

class Application 
  def call(env)
    request = Rack::Request.new(env)
    Router.new(request).route!
  end
end



