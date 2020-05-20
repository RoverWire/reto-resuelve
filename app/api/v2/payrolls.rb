module API
  module V2
    class Payrolls < Grape::API
      version :v2, using: :path

      resource :payrolls do
        get do
          { message: 'It Works too!' }
        end
      end
    end
  end
end
