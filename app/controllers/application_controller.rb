class ApplicationController < ActionController::API
  include Knock::Authenticable
  config.time_zone = 'La Paz'
end
