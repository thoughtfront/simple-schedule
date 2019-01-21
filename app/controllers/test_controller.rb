class TestController < ApplicationController

  # Override Clearance::SessionsController#create
  def index
    render :json => {msg: 'Test Succeeded'}
  end

end
