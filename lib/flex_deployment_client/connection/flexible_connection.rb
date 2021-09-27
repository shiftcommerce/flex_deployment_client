require "flex_deployment_client/middleware/flexible_json_request"
module FlexDeploymentClient
  class FlexibleConnection < JsonApiClient::Connection
    def initialize(options = {})
      site = options.fetch(:site)
      adapter_options = Array(options.fetch(:adapter, Faraday.default_adapter))
      @faraday = Faraday.new(site) do |builder|
        builder.request :json
        builder.request :multipart
        builder.use FlexibleJsonRequest
        builder.use JsonApiClient::Middleware::Status, {}
        builder.use JsonApiClient::Middleware::ParseJson
        builder.adapter(*adapter_options)
      end
      faraday.basic_auth(FlexDeploymentClient.config.user, FlexDeploymentClient.config.password)
      yield(self) if block_given?
    end
  end
end
