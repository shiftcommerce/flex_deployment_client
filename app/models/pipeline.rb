module FlexDeploymentClient
  class Pipeline < ModelBase
    
    has_many :deployments, class_name: "::FlexDeploymentClient::Deployment"

    def name
      self[:name]
    end

  end
end