require "flex_deployment_client/middleware/uploaded_file_middleware"
require "flex_deployment_client/requestor/uploaded_file_requestor"
module FlexDeploymentClient
  class UploadedFile < ModelBase

    def file=(value)
      if value=~/^file:\/\//
        filename = value.match(/^file:\/\/(.*)$/)[1]
        MIME::Types.type_for(filename).first.content_type
        bin_data = File.read_binary(filename)
        super("data:image/jpg;base64,#{Base64.encode64(bin_data)}")
      end
    end

    def self.upload(attributes)
      parser.parse(self, connection.run(:post, table_name, { data: { type: :uploaded_files, attributes: attributes } }, custom_headers.merge({ "Content-Type": "multipart/form-data" }))).first
    end
  end
end