module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    include ApiV0::ExceptionHandlers

    use ApiV0::Auth::Middleware

    helpers ::ApiV0::Helpers

    mount Ping
  end
end
