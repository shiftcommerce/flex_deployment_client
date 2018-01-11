module FlexDeploymentClient
  class Deployment < ModelBase
    has_one  :pipeline, class_name: "::FlexDeploymentClient::Pipeline"
    has_many :webhooks, class_name: "::FlexDeploymentClient::Webhook"

    def self.create(attrs, options = {}, &block)
      webhooks = options.fetch(:webhooks, []).map { |webhook| FlexDeploymentClient::Webhook.create(webhook)}
      new(attrs).tap do |r|
        r.relationships[:webhooks] = webhooks
        r.save
      end
    end

    def is_production?
      self.stage == "production"
    end

    def can_be_promoted?
      (self.stage == "staging") && self.domains.present?
    end
  end
end