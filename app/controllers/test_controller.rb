class TestController < ApplicationController
  include Authorization
  before_action :require_login

  # Override Clearance::SessionsController#create
  def index
    render :json => {msg: 'Test Succeeded'}
  end

end
