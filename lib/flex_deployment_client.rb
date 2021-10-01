require "flex_deployment_client/version"
require "json_api_client"
module FlexDeploymentClient
  autoload :Pipeline, File.expand_path("../app/models/pipeline.rb", __dir__)
  autoload :UploadedFile, File.expand_path("../app/models/uploaded_file.rb", __dir__)
  autoload :Deployment, File.expand_path("../app/models/deployment.rb", __dir__)
  autoload :Webhook, File.expand_path("../app/models/webhook.rb", __dir__)
  autoload :ModelBase, File.expand_path("../app/models/model_base.rb", __dir__)
  autoload :Config, File.expand_path("./flex_deployment_client/config.rb", __dir__)

  def self.gem_root
    File.expand_path("../", __dir__)
  end

  def self.config
    FlexDeploymentClient::Config.instance.tap do |config|
      yield config if block_given?
      config.reconfigure_all! if block_given?
    end
  end
end
