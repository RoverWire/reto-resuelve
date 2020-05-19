module API
  module V1
    class Payrolls < Grape::API
      version :v1, using: :path

      resource :payrolls do
        get do
          { message: 'It Works!' }
        end

        post 'calculate' do
          # team = params[:json]
          # team = request.body.read
          # team = JSON.parse(team) # team.blank?

          { message: 'test' }
        end
      end
    end
  end
end
