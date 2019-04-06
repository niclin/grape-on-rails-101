module ApiV0
  module Auth
    class Authenticator
      def initialize(request, params)
        @request = request
        @params  = params
      end

      def authenticate!
        check_token!
        token
      end

      def token
        @token = ApiAccessToken.joins(:user).where(key: @params[:access_key]).first
      end

      def check_token!
        return @params[:access_key] unless token
      end
    end
  end
end
