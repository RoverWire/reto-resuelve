module API
  module V2
    class Payrolls < Grape::API
      version :v2, using: :path

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

          optional :teams_setup, type: Array[JSON] do
            requires :equipo, type: String
            requires :A, type: Integer
            requires :B, type: Integer
            requires :C, type: Integer
            requires :Cuauh, type: Integer
          end
        end

        post '/' do
          empty_data?

          teams_setup = params[:teams_setup]
          PayrollService.new(params[:players_list], teams_setup).process
        end
      end
    end
  end
end
