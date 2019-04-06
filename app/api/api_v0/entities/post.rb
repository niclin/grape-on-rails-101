module ApiV0
  module Entities
    class Post < Entities::Base
      expose :id
      expose :title
      expose :context
      expose :created_at, format_with: :iso8601
    end
  end
end
