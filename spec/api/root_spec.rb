require_relative '../spec_helper'

describe API::Root do
  context 'GET /api/' do
    it 'returns 404 response' do
      get '/api'
      expect_status(404)
    end
  end
end
