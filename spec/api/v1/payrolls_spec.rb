require 'spec_helper'

describe API::V1::Payrolls do
  describe 'GET /api/v1/payrolls/' do
    context 'when is requested' do
      it 'returns 200 response' do
        get '/api/v1/payrolls/'
        expect_status(200)
      end
    end
  end

  describe 'POST /api/v1/payrolls/calculate' do
    context 'when receive an empty request' do
      before do
        post '/api/v1/payrolls/calculate'
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should provide an error message due missing list' do
        expect(json_body[:error]).to include('players_list is missing')
      end
    end

    context 'when receive empty players list' do
      before do
        post(
          '/api/v1/payrolls/calculate',
          '{ "players_list": [] }',
          { 'content_type' => 'application/json' }
        )
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should provide an error message due empty data' do
        expect(json_body[:error]).to eq('No data provided')
      end
    end

    context 'when receive invalid players_list' do
      before do
        post(
          '/api/v1/payrolls/calculate',
          { players_list: { foo: 'test' } }
        )
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should provide an error message due invalid list' do
        expect(json_body[:error]).to include('players_list is invalid')
      end
    end

    context 'when receive a player with a missing attribute' do
      before do
        post(
          '/api/v1/payrolls/calculate',
          { players_list: [player_without_salary] }
        )
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should inform about missing attribute' do
        expect(json_body[:error]).to eq('players_list[sueldo] is missing')
      end
    end

    context 'when receive a players list with a player with invalid schema' do
      before do
        post(
          '/api/v1/payrolls/calculate',
          { players_list: [valid_player, player_without_salary] }
        )
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should inform about missing attribute' do
        expect(json_body[:error]).to eq('players_list[sueldo] is missing')
      end
    end

    context 'when receive a players list with an invalid player level' do
      let(:message) { 'players_list[nivel] does not have a valid value' }

      before do
        post(
          '/api/v1/payrolls/calculate',
          { players_list: [valid_player, player_with_invalid_level] }
        )
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should inform the invalid level' do
        expect(json_body[:error]).to eq(message)
      end
    end
  end
end
