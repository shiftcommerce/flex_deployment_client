module FlexDeploymentClient
  class UploadedFileRequestor < JsonApiClient::Query::Requestor
    def create(*)
      super
    end

    def dynamic_connection(type, path, params)
      connection
    end

    def request(type, path, params)
      klass.parser.parse(klass, dynamic_connection(type, path, params).run(type, path, params, klass.custom_headers))
    end
  end
end
