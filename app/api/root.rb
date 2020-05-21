require_relative './v1/payrolls'
require_relative './v2/payrolls'

module API
  class Root < Grape::API
    default_format :json
    prefix :api
    rescue_from EOFError do |e|
      # Prevent EOF error caused on POST multipart/form-data with no data
      error!("#{e} due empty request", 400)
    end

    helpers do
      # Prevent any request with no data or empty player list.
      def prevent_empty_data
        return unless params.empty? || params[:players_list].empty?

        error!('No data provided', 400)
      end
    end

    get '/' do
      content_type 'text/plain'
      body 'API de Prueba para Resuelve'
    end

    mount API::V1::Payrolls
    mount API::V2::Payrolls

    add_swagger_documentation
  end
end
