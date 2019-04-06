module ApiV0
  module ExceptionHandlers

    def self.included(base)
      base.instance_eval do

        # 只要是 grape validation 沒有過的 Error 都返回自定義狀態碼 1001
        rescue_from Grape::Exceptions::ValidationErrors do |e|
          rack_response({
            error: {
              code: 1001,
              message: e.message
            }
          }.to_json, e.status)
        end

        # 如果因為找不到數據 raise Error, 都返回 404 Not Found
        rescue_from ActiveRecord::RecordNotFound do
          rack_response({ 'message' => '404 Not found' }.to_json, 404)
        end

        # 任何不存在的路由都返回 404 Not Found
        route :any, '*path' do
          error!('404 Not Found', 404)
        end
      end
    end
  end

  class Error < Grape::Exceptions::Base
    attr :code, :text

    def initialize(opts={})
      @code    = opts[:code]   || 2000
      @text    = opts[:text]   || ''

      @status  = opts[:status] || 400
      @message = { error: { code: @code, message: @text } }
    end
  end

  class AuthorizationError < Error
    def initialize
      super code: 2001, text: 'Authorization failed', status: 401
    end
  end
end
