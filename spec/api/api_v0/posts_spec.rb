describe ApiV0::Posts do
  before(:all) do
    @user = create(:user)
    @posts = create_list(:post, 3, user: @user)
    @access_token = create(:api_access_token, user: @user)
  end

  context 'GET /api/v0/posts' do
    it 'should return 200 and posts' do
      get '/api/v0/posts', params: { access_key: @access_token.key }

      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result.size).to eq(@user.posts.size)
    end
  end

  context "Get /api/v0/posts/:id" do
    it "return a post by id" do
      post = create(:post, user: @user)

      get "/api/v0/posts/#{post.id}", params: { access_key: @access_token.key }

      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result["title"]).to eq(post.title)
    end
  end

  context "Post /api/v0/posts" do
    it "create new post" do

      title = "Title"
      context = "Context"

      post "/api/v0/posts", params: { access_key: @access_token.key, title: title, context: context }

      result = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(result["title"]).to eq(title)
      expect(result["context"]).to eq(context)
    end
  end

  context "Pacth /api/v0/posts/:id" do
    it "update a post by id" do
      post = @user.posts.last

      title = "Edited title"
      context = "Edited context"

      patch "/api/v0/posts/#{post.id}", params: { access_key: @access_token.key, title: title, context: context }

      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result["title"]).to eq(title)
      expect(result["context"]).to eq(context)
    end
  end

  context "Delete /api/v0/posts/:id" do
    it "delete a post by id" do
      post = @user.posts.last

      delete "/api/v0/posts/#{post.id}", params: { access_key: @access_token.key }

      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result["title"]).to eq(post.title)
      expect(result["context"]).to eq(post.context)
      expect{ Post.find(post.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
