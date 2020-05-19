require 'grape'
require 'grape-swagger'
require_relative './v1/payrolls'

module API
  class Root < Grape::API
    format :json
    prefix :api

    mount API::V1::Payrolls
  end
end
