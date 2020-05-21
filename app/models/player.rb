class Player
  attr_accessor(
    :nombre,
    :nivel,
    :goles,
    :sueldo,
    :bono,
    :sueldo_completo,
    :equipo
  )

  def initialize(*args)
    args = args[0]
    @nombre = args[:nombre]
    @nivel  = args[:nivel]
    @goles  = args[:goles]
    @sueldo = args[:sueldo]
    @bono   = args[:bono]
    @sueldo_completo = args[:sueldo_completo]
    @equipo = args[:equipo]
  end

  # Method to calculate player's final payment
  # using the required minimun goals and the team percentage

  def calculate_payroll(required_score, team_percentage)
    return if required_score.nil? || team_percentage.nil?

    player_percentage = (goles * 100) / required_score
    percentage_earned = (player_percentage + team_percentage) / 2
    @sueldo_completo = sueldo + ((percentage_earned * bono) / 100)
  end

  # Methods below are monkey patches to allow json output
  # of the player objects.

  def as_json(*)
    {
      nombre: nombre,
      nivel: nivel,
      goles: goles,
      sueldo: sueldo,
      bono: bono,
      sueldo_completo: sueldo_completo,
      equipo: equipo
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
