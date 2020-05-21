require_relative './v1/payrolls'
require_relative './v2/payrolls'

module API
  class Root < Grape::API
    default_format :json
    prefix :api
    rescue_from EOFError do |e|
      # Prevent empty request handling
      error!("#{e} due empty request", 400)
    end

    helpers do
      def empty_data?
        return unless params.empty? || params[:players_list].empty?

        error!('No data provided', 400)
      end
    end

    mount API::V1::Payrolls
    mount API::V2::Payrolls
  end
end
