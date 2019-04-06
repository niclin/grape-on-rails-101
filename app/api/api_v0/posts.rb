module ApiV0
  class Posts < Grape::API
    before { authenticate! }

    desc "Get all your posts"
    get "/posts" do
      current_user.posts
    end
  end
end
