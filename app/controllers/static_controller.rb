class StaticController < ApplicationController
  def home
    render json: { status: 'it is working!' }
  end
end
