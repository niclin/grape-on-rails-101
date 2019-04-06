module ApiV0
  module Helpers

    def authenticate!
      current_user or raise AuthorizationError
    end

    def current_user
      @current_user ||= env["api_v0.user"]
    end
  end
end
