module FlexDeploymentClient
  class Deployment < ModelBase
    def self.create(attrs, options = {}, &block)
      webhooks = options.fetch(:webhooks, []).map { |webhook| FlexDeploymentClient::Webhook.create(webhook)}
      new(attrs).tap do |r|
        r.relationships[:webhooks] = webhooks
        r.save
      end
    end
    has_many :webhooks, class_name: "::FlexDeploymentClient::Webhook"

  end
end