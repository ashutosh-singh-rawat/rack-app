class JsonResponse
  def initialize(app)
    @app = app
  end

  def call(env)
    env['HTTP_ACCEPT'] = 'application/json'
    @app.call env
  end
end