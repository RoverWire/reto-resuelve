require 'grape'
require 'grape-swagger'
require_relative './v1/payrolls'

module API
  class Root < Grape::API
    format :json
    prefix :api
    rescue_from :all

    mount API::V1::Payrolls
  end
end
