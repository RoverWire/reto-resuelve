class PayrollService
  attr_reader :provided_list, :players, :teams, :config_list

  def initialize(list, config = {})
    @provided_list = list
    @config_list = config
    @players = []
    @teams = []
  end

  # Perform all the steps to calculate the payroll

  def process
    setup_teams
    setup_players
    process_payrolls

    players
  end

  # Create the players object array and
  # updates team scores on the same loop.

  def setup_players
    provided_list.each do |item|
      player = Player.new(item)
      players << player

      Team.find(player.equipo, teams)
          .add_player_score(player.goles, player.nivel)
    end
  end

  # Creates all the teams, selecting distincts
  # team names from the players list.

  def setup_teams
    provided_list.map { |item| item[:equipo] }.uniq.each do |item|
      next unless Team.find(item, teams).nil?

      team = Team.new(name: item)
      team.get_config_from_list(config_list)
      @teams << team
    end
  end

  # Make the operations to calculate
  # the final payment for the player.

  def process_payrolls
    players.each do |player|
      team = Team.find(player.equipo, teams)
      team.calculate_percentage
      player.calculate_payroll(team.config[player.nivel], team.percentage)
    end
  end
end
