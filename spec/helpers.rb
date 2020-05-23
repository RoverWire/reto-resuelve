module Helpers
  def base_request(use_symbols = false)
    current_path = File.join(File.dirname(__FILE__))
    file_path = File.join(current_path, 'fixtures', 'base_request.json')
    content = IO.read(file_path)

    JSON.parse(content, symbolize_names: use_symbols)
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

  def valid_team_settings
    {
      'equipo': 'azul',
      'A': 2,
      'B': 4,
      'C': 6,
      'Cuauh': 12
    }
  end

  def invalid_team_settings
    {
      'nombre': 'azul',
      'A': 2,
      'B': 4,
      'C': 6,
      'Cuauh': 12
    }
  end
end
