require "flex_deployment_client/middleware/uploaded_file_middleware"

module FlexDeploymentClient
  class UploadedFile < ModelBase
    def self.upload(attributes)
      body = {data: {type: :uploaded_files, attributes: attributes}}
      headers = {"Content-Type": "application/vnd.api+json"}

      response = connection.run(:post, table_name, body: body, headers: custom_headers.merge(headers))

      parser.parse(self, response).first
    end
  end
end
