module API
  module V1
    class Payrolls < Grape::API
      version :v1, using: :path

      resource :payrolls do
        params do
          requires :players_list, type: Array[JSON] do
            requires :nombre, type: String
            requires :nivel, type: String, values: %w[A B C Cuauh]
            requires :goles, type: Integer
            requires :sueldo, type: Integer
            requires :bono, type: Integer
            optional :sueldo_completo, type: Integer
            requires :equipo, type: String
          end
        end

        post '/' do
          prevent_empty_data

          PayrollService.new(params[:players_list]).process
        end
      end
    end
  end
end
