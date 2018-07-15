require './application'
require_relative './middlewares/json_response'
require_relative './middlewares/request_config'
use Rack::Reloader, 0
use JsonResponse
use EnsureGetRequest
use Rack::ConditionalGet
use Rack::ETag
use Rack::Auth::Basic, "Authentication" do |username, password|
  [username, password] == ['admin', 'admin']
end
run Application.new