require "flex_deployment_client/middleware/uploaded_file_middleware"
require "flex_deployment_client/requestor/uploaded_file_requestor"
module FlexDeploymentClient
  class UploadedFile < ModelBase

    def self.upload(attributes)
      parser.parse(self, connection.run(:post, table_name, { data: { type: :uploaded_files, attributes: attributes } }, custom_headers.merge({ "Content-Type": "multipart/form-data" }))).first
    end
  end
end