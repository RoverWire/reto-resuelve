class Team
  attr_accessor :name, :total_scored, :total_required, :percentage

  def initialize(*args)
    args = args[0]
    @name = args[:name]
    @total_required = 0
    @total_scored = 0
  end

  def self.find(name, teams)
    teams.select { |team| team.name == name }.first
  end
end
