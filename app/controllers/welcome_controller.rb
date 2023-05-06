class WelcomeController < ApplicationController
  def index
    render json: { message: 'Welcome to Viking' }
  end
end
