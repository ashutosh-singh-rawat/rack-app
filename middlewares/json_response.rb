class JsonResponse
  def initialize(app)
    @app = app
  end

  # Set the 'Accept' header to 'application/json' no matter what.
  def call(env)
    env['HTTP_ACCEPT'] = 'application/json'
    @app.call env
  end
end