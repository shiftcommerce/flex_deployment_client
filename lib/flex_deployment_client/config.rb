require "singleton"
module FlexDeploymentClient
  class Config
    include Singleton
    attr_accessor :user, :password, :root_url, :adapter

    # Informs all models that the configuration may have changed
    # but only if ApiBase is defined - else nothing has loaded yet
    # so they wont need reconfiguring
    def reconfigure_all!
      FlexDeploymentClient::ModelBase.reconfigure_all if FlexDeploymentClient.const_defined? "ModelBase"
    end

  end

end