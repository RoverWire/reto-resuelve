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
