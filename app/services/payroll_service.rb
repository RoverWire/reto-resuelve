class PayrollService
  attr_reader :provided_list, :players, :teams, :team_config

  def initialize(list, config = {})
    @provided_list = list
    @team_config = config
    @players = []
    @teams = []
  end

  def process
    setup_teams
    setup_players

    players
  end

  def setup_players
    provided_list.each do |item|
      player = Player.new(item)
      players << player
    end
  end

  def setup_teams
    provided_list.map { |item| item['equipo'] }.uniq.each do |item|
      team = Team.new(name: item)
      teams << team
    end
  end
end
