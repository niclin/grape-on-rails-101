module ApiV0
  class Base < Grape::API
    version 'v0', using: :path

    include ApiV0::ExceptionHandlers

    use ApiV0::Auth::Middleware

    helpers ::ApiV0::Helpers

    mount Ping
    mount Posts

    add_swagger_documentation(
      mount_path: 'swagger_doc',
      hide_format: true,
      hide_documentation_path: true
    )
  end
end
