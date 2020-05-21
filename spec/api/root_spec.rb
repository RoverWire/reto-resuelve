require 'spec_helper'

describe API::Root do
  context 'GET /api/' do
    it 'returns 200 response' do
      get '/api'
      expect_status(200)
    end
  end

  context 'GET /api/404' do
    it 'returns 404 response' do
      get '/api/404'
      expect_status(404)
    end
  end
end
