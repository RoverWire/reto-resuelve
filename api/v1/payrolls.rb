module API
  module V1
    class Payrolls < Grape::API
      version :v1, using: :path

      resource :payrolls do
        get do
          { message: 'It Works!' }
        end
      end
    end
  end
end
