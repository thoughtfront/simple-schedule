class TestController < ApplicationController
  before_action :require_login

  # Override Clearance::SessionsController#create
  def index
    render :json => {msg: 'Test Succeeded'}
  end

end
