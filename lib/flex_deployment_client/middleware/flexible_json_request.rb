module FlexDeploymentClient
  class FlexibleJsonRequest < Faraday::Middleware
    CONTENT_TYPE = 'Content-Type'.freeze unless defined? CONTENT_TYPE

    class << self
      attr_accessor :mime_type
    end
    self.mime_type = 'application/json'.freeze

    def call(env)
      match_content_type(env) do
        env[:request_headers]["Content-Type"] = 'application/vnd.api+json'
        env[:request_headers]["Accept"] = 'application/vnd.api+json'
      end
      @app.call env
    end

    def match_content_type(env)
      if process_request?(env)
        yield
      end
    end

    def process_request?(env)
      type = request_type(env)
      type.empty? or type == self.class.mime_type
    end

    def request_type(env)
      type = env.request_headers[CONTENT_TYPE].to_s
      type = type.split(';', 2).first if type.index(';')
      type
    end
  end
end