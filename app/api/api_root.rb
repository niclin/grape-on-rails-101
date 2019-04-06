class ApiRoot < Grape::API
  PREFIX = '/api'.freeze

  format :json

  mount ApiV0::Base
end
