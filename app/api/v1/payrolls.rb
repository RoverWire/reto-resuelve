module API
  module V1
    class Payrolls < Grape::API
      version :v1, using: :path

      helpers do
        def empty_data?
          return unless params.empty? || params[:players_list].empty?

          error!('No data provided', 400)
        end
      end

      resource :payrolls do
        get '/' do
          { message: 'It Works!' }
        end

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
          empty_data?

          PayrollService.new(params[:players_list]).process
        end
      end
    end
  end
end
