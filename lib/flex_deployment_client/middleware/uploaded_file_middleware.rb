module FlexDeploymentClient
  class UploadedFileMiddleware < ::Faraday::Middleware
    def call(env)
      if is_posting_file?(env)
        env[:request_headers]["Content-Type"] = "multipart/form-data"
        env[:body] = Oj.load(env[:body])
        ::Faraday::Request::Multipart.new(@app).call(env)
      else
        @app.call(env)
      end
    end

    private

    def is_posting_file?(env)
      if env[:body].present?
        json = Oj.load(env[:body])
        json.key?("data") && json["data"].key?("attributes") && json["data"]["attributes"].key?("file")
      end
    end
  end
end
