require 'spec_helper'

describe API::V1::Payrolls do
  describe 'POST /api/v1/payrolls/' do
    context 'when receive an empty request' do
      before do
        post '/api/v1/payrolls/'
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
          '/api/v1/payrolls/',
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
          '/api/v1/payrolls/',
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
          '/api/v1/payrolls/',
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
          '/api/v1/payrolls/',
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
          '/api/v1/payrolls/',
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

    context 'when receive one valid player' do
      before do
        post(
          '/api/v1/payrolls/',
          { players_list: [valid_player] }
        )
      end

      it 'returns 201 response' do
        expect_status(201)
      end

      it 'should include full data schema' do
        expect(json_body[0].keys).to contain_exactly(
          :nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo
        )
      end

      it 'should have full payroll calculated' do
        expect(json_body[0][:sueldo_completo]).to eq(34_000)
      end
    end

    context 'when receive the input json provided as example' do
      before do
        post(
          '/api/v1/payrolls/',
          { players_list: base_request }
        )
      end

      it 'returns 201 response' do
        expect_status(201)
      end

      it 'should respond with array' do
        expect_json_types(:array)
      end

      it 'should have Juan Perez full payroll' do
        expect(json_body[0][:sueldo_completo]).to eq(67_750)
      end

      it 'should have El Cuauh full payroll' do
        expect(json_body[1][:sueldo_completo]).to eq(144_700)
      end

      it 'should have Cosme Fulanito full payroll' do
        expect(json_body[2][:sueldo_completo]).to eq(34_400)
      end

      it 'should have El Rulo full payroll' do
        expect(json_body[3][:sueldo_completo]).to eq(42_450)
      end
    end
  end
end
