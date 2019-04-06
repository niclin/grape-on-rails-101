describe ApiV0::Ping do
  context 'GET /api/v0/ping' do
    it 'should return 200 and pong' do
      get '/api/v0/ping'

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq("pong")
    end
  end
end
