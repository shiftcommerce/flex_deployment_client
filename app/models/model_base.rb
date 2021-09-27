require "flex_deployment_client/connection/flexible_connection"

module FlexDeploymentClient
  class ModelBase < JsonApiClient::Resource
    config = FlexDeploymentClient.config

    self.site = config.root_url

    self.connection_options = {
      adapter: config.adapter
    }

    connection do |conn|
      conn.use Faraday::Request::Authorization, :basic, config.user, config.password
      conn.use Faraday::Request::Json
      conn.use Faraday::Request::Multipart
      conn.use FlexibleJsonRequest
      conn.use JsonApiClient::Middleware::Status
      conn.use JsonApiClient::Middleware::ParseJson
    end
  end
end
