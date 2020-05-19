require 'grape'
require 'grape-swagger'
require 'pry'
require_relative './v1/payrolls'

module API
  class Root < Grape::API
    default_format :json
    prefix :api
    rescue_from EOFError do |e|
      # Prevent empty request handling
      error!("#{e} due empty request", 400)
    end

    mount API::V1::Payrolls
  end
end
