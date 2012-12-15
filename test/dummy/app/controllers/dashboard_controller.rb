class DashboardController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: { message: 'These are not the droids you are looking for' } }
      format.js { render 'index' }
    end
  end
  
  def new
    respond_to do |format|
      format.html
      format.json { render json: { message: 'These are not the droids you are looking for' } }
      format.js { render 'new' }
    end
  end
end
