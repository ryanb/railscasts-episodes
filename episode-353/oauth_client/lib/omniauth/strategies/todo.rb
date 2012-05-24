module OmniAuth
  module Strategies
    class Todo < OmniAuth::Strategies::OAuth2
      option :name, :todo

      option :client_options, {
        site: "http://localhost:3000",
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {name: raw_info["name"]}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/user').parsed
      end
    end
  end
end
