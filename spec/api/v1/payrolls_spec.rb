require 'spec_helper'

describe API::V1::Payrolls do
  context 'GET /api/v1/payrolls/' do
    it 'returns 200 response' do
      get '/api/v1/payrolls/'
      expect_status(200)
    end
  end

  context 'POST /api/v1/payrolls/calculate' do
    it 'returns 400 response with an empty request' do
      post '/api/v1/payrolls/calculate'
      expect_status(400)
    end
  end
end
