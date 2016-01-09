require "flex_deployment_client/connection/flexible_connection"
module FlexDeploymentClient
  class ModelBase < JsonApiClient::Resource
    self.site = FlexDeploymentClient.config.root_url
    self.connection_class = FlexibleConnection
    self.connection_options.merge! adapter: FlexDeploymentClient.config.adapter || :net_http
    class << self
      def reconfigure_all
        subclasses.each do |sub|
          sub.reconfigure
        end
        reconfigure
      end

      def reconfigure
        self.site = FlexDeploymentClient.config.root_url
        self.connection_class = FlexibleConnection
        self.connection_options.merge! adapter: FlexDeploymentClient.config.adapter || :net_http
        reload_connection_if_required
      end

      def reload_connection_if_required
        _build_connection(true) if connection_object
      end
    end

    reconfigure
  end
end