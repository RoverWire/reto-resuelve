class Team
  attr_accessor :name, :total_scored, :total_required, :percentage, :config

  def initialize(*args)
    args = args[0]
    @name = args[:name]
    @total_required = 0
    @total_scored = 0
    @config = { 'A' => 5, 'B' => 10, 'C' => 15, 'Cuauh' => 20 }
    @percentage = 0
  end

  def self.find(name, teams)
    teams.select { |team| team.name == name }.first
  end

  def calculate_percentage
    return if percentage

    @percentage = (total_scored * 100) / total_required
  end

  def add_player_score(goals, level)
    @total_scored = total_scored + goals
    @total_required = total_required + config[level]
  end

  def update_configuration(new_config)
    return unless new_config

    new_config.delete('equipo')
    @config = new_config
  end

  def get_config_from_list(list)
    return if list.empty?

    settings = list.select { |item| item['equipo'] == name }.first
    update_configuration(settings)
  end
end
