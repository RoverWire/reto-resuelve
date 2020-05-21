class Team
  attr_accessor :name, :total_scored, :total_required, :percentage, :config

  # When initialize the object, we set default minimun
  # required score to the team, since each team can be
  # custom settings to calculate players payroll.

  def initialize(*args)
    args = args[0]
    @name = args[:name]
    @total_required = 0
    @total_scored = 0
    @config = { 'A' => 5, 'B' => 10, 'C' => 15, 'Cuauh' => 20 }
    @percentage = 0
  end

  # Utility method to find the created object 
  # by its team name

  def self.find(name, teams)
    teams.select { |team| team.name == name }.first
  end

  # Calculate team score percentage

  def calculate_percentage
    return if percentage.positive?

    @percentage = (total_scored * 100) / total_required
  end

  # Increment team score and minimun required score
  # with the player's scores

  def add_player_score(goals, level)
    @total_scored = total_scored + goals
    @total_required = total_required + config[level]
  end

  # Updates team custom settings. This can be used to parse
  # custom configuration schema directly.

  def update_configuration(new_config)
    return unless new_config

    new_config.delete('equipo')
    new_config.delete(:equipo)
    @config = new_config
  end

  # Search for the current team custom setting
  # through the provided setting list.

  def get_config_from_list(list)
    return if list.blank?

    settings = list.select { |item| item[:equipo] == name }.first
    update_configuration(settings)
  end
end
