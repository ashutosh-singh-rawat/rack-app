class BaseController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  private

    def render_json(body, status: 200)
      [status, { "Content-Type" => "application/json" }, [body.to_json]]
    end

    def params
      request.params.deep_symbolize_keys!
    end
end