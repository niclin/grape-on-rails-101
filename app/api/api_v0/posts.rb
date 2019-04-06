module ApiV0
  class Posts < Grape::API
    before { authenticate! }

    desc "Get all your posts"
    get "/posts" do
      posts = current_user.posts

      present posts, with: ApiV0::Entities::Post
    end

    desc "Create new post"
    params do
      requires :title, type: String
      requires :context, type: String
    end
    post "/posts" do
      post = current_user.posts.new(declared(params, include_missing: false).except(:access_key))

      if post.save
        present post, with: ApiV0::Entities::Post
      else
        raise StandardError, $!
      end
    end

    desc "Get your post"
    params do
      requires :id, type: String, desc: 'Post ID.'
    end
    get "/posts/:id" do
      post = current_user.posts.find_by(id: params[:id])

      present post, with: ApiV0::Entities::Post
    end
  end
end
