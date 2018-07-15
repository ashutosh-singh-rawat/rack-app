class EnsureGetRequest
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env
    unless request.get?
      [422, {'content_type' => env['HTTP_ACCEPT']}, [{success: false, message: "Only Get Request are allowed"}.to_json]]
    else
      @app.call env
    end
  end
end