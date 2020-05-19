require_relative '../../spec_helper'

describe API::V1::Payrolls do
  context 'GET /api/v1/payrolls/' do
    it 'returns 200 response' do
      get '/api/v1/payrolls/'
      expect_status(200)
    end
  end
end
