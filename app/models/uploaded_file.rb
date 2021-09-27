require "flex_deployment_client/middleware/uploaded_file_middleware"

module FlexDeploymentClient
  class UploadedFile < ModelBase
    def file=(value)
      binding.pry

      if /^file:\/\//.match?(value)
        filename = value.match(/^file:\/\/(.*)$/)[1]
        mime_type = MIME::Types.type_for(filename).first.content_type
        bin_data = File.open(filename, "rb") { |f| f.read }
        super("data:#{mime_type};base64,#{Base64.encode64(bin_data)}")
      elsif /^http(s?):\/\//.match?(value)
        self.file_url = value
      else
        super
      end
    end

    def self.upload(attributes)
      binding.pry

      response = connection.run(:post, table_name, body: {data: {type: :uploaded_files, attributes: attributes}}, headers: custom_headers.merge({"Content-Type": "application/vnd.api+json"}))
      parser.parse(self, response).first
    end
  end
end
