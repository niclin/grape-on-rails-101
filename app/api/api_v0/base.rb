module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    use ApiV0::Auth::Middleware

    mount Ping
  end
end
