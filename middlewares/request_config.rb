class EnsureGetRequest
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env
    unless request.get?
      [422, {}, ['Error! :: Only GET request are allowed']]
    else
      @app.call env
    end
  end
end