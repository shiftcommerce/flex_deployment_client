module FlexDeploymentClient
  class Pipeline < ModelBase
    has_many :deployments, class_name: "::FlexDeploymentClient::Deployment"

  end
end