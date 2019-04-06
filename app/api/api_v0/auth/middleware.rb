module ApiV0
  module Auth
    class Middleware < Grape::Middleware::Base
      def before
        if auth_provided?
          @env["api_v0.token"] = Authenticator.new(request, params).authenticate!
          @env["api_v0.user"] ||= @env["api_v0.token"].try(:user)
        end
      end

      def request
        @request ||= ::Grape::Request.new(env)
      end

      def params
        @params ||= request.params
      end

      def auth_provided?
        params[:access_key].present?
      end
    end
  end
end
