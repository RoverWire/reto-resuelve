require 'spec_helper'

describe PayrollService do
  let(:service) { PayrollService.new(base_request, [valid_team_settings]) }

  describe '#setup_teams' do
    context 'when a players list is provided' do
      it 'should not have any team' do
        expect(service.teams.count).to eq(0)
      end

      it 'should create the teams needed' do
        service.setup_teams
        expect(service.teams.count).to eq(1)
      end
    end
  end
end
