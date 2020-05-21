require 'spec_helper'

describe API::V2::Payrolls do
  describe 'POST /api/v2/payrolls/' do
    context 'when receive an empty request' do
      before do
        post '/api/v2/payrolls/'
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
          '/api/v2/payrolls/',
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

    context 'when receive a list with 4 valid player without team settings' do
      before do
        post '/api/v2/payrolls/', { players_list: base_request }
      end

      it 'should return same number of players' do
        expect_json_sizes(4)
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

    context 'when receive valid list along invalid settings schema' do
      let(:message) {
        'teams_setup is invalid, teams_setup[equipo] is missing'
      }

      before do
        post(
          '/api/v2/payrolls/',
          { players_list: base_request, teams_setup: invalid_team_settings }
        )
      end

      it 'returns 400 response' do
        expect_status(400)
      end

      it 'should notify about the missing attributes' do
        expect(json_body[:error]).to eq(message)
      end
    end

    context 'when receive a list with blue team custom settings' do
      before do
        post(
          '/api/v2/payrolls/',
          { players_list: base_request, teams_setup: [valid_team_settings] }
        )
      end

      it 'returns 201 response' do
        expect_status(201)
      end

      it 'should return same number of players' do
        expect_json_sizes(4)
      end

      it 'should have Juan Perez full payroll' do
        expect(json_body[0][:sueldo_completo]).to eq(67_750)
      end

      it 'should have El Cuauh full payroll' do
        expect(json_body[1][:sueldo_completo]).to eq(177_100)
      end

      it 'should have Cosme Fulanito full payroll' do
        expect(json_body[2][:sueldo_completo]).to eq(50_700)
      end

      it 'should have El Rulo full payroll' do
        expect(json_body[3][:sueldo_completo]).to eq(42_450)
      end
    end
  end
end
