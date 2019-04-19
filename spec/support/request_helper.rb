module Requests
  module JsonHelpers
    def json
      JSON.parse(last_response.body)
    end

    def response_status
      last_response.status
    end
  end
end
