module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    mount Ping
  end
end
