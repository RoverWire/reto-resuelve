require 'spec_helper'

describe PayrollService do
  let(:provided_list) { base_request(true) }
  let(:service) { PayrollService.new(provided_list, [valid_team_settings]) }

  describe '#setup_teams' do
    context 'when a players list is provided' do
      it 'should not have any team before run the method' do
        expect(service.teams.count).to eq(0)
      end

      it 'should create the teams needed' do
        service.setup_teams
        expect(service.teams.count).to eq(2)
      end
    end
  end

  describe '#setup_players' do
    before { service.setup_teams }

    context 'when a players list is provided' do
      it 'should not have any player before run the method' do
        expect(service.players.count).to eq(0)
      end

      it 'should create the player obbjects' do
        service.setup_players
        expect(service.players.count).to eq(4)
      end
    end
  end

  describe '#process_payrolls' do
    before do
      service.setup_teams
      service.setup_players
    end

    context 'when a players list is provided' do
      it 'players should not have final payroll before run the method' do
        expect(service.players[0].sueldo_completo).to eq(nil)
        expect(service.players[1].sueldo_completo).to eq(nil)
        expect(service.players[2].sueldo_completo).to eq(nil)
        expect(service.players[3].sueldo_completo).to eq(nil)
      end

      it 'should calculate the final payroll from each player' do
        service.process_payrolls
        expect(service.players[0].sueldo_completo).to eq(67_750)
        expect(service.players[1].sueldo_completo).to eq(177_100)
        expect(service.players[2].sueldo_completo).to eq(50_700)
        expect(service.players[3].sueldo_completo).to eq(42_450)
      end
    end
  end
end
