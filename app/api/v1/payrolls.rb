module API
  module V1
    class Payrolls < Grape::API
      version :v1, using: :path

      helpers do
        def empty_data?
          params.empty? || params[:json].empty?
        end
      end

      resource :payrolls do
        get do
          { message: 'It Works!' }
        end

        params do
          requires :json, type: Array[JSON] do
            requires :nombre, type: String
            requires :nivel, type: String, values: %w[A B C Cuauh]
            requires :goles, type: Integer
            requires :sueldo, type: Integer
            requires :bono, type: Integer
            optional :sueldo_completo, type: Integer
            requires :equipo, type: String
          end
        end

        post 'calculate' do
          error!('No data provided', 400) if empty_data?

          { message: 'test' }
        end
      end
    end
  end
end
