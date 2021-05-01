class StaticController < ApplicationController
  def home
    render json: { message: 'it is working!' }, status: 200
  end
end
