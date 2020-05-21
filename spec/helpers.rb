module Helpers
  def base_request
    current_path = File.join(File.dirname(__FILE__))
    file_path = File.join(current_path, 'fixtures', 'files', 'players.json')
    response = IO.read(file_path)

    JSON.parse(response)
  end

  def valid_player
    {
      'nombre': 'Cosme Fulanito',
      'nivel': 'A',
      'goles': 7,
      'sueldo': 20_000,
      'bono': 10_000,
      'sueldo_completo': nil,
      'equipo': 'azul'
    }
  end

  def player_without_salary
    {
      'nombre': 'Juan Perez',
      'nivel': 'C',
      'goles': 10,
      'bono': 25_000,
      'equipo': 'rojo'
    }
  end

  def player_with_invalid_level
    {
      'nombre': 'Cosme Fulanito',
      'nivel': 'X',
      'goles': 7,
      'sueldo': 20_000,
      'bono': 10_000,
      'sueldo_completo': nil,
      'equipo': 'azul'
    }
  end
end
