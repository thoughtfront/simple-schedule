class Auth::SessionsController < Clearance::SessionsController
  skip_before_action :verify_authenticity_token

  # Override Clearance::SessionsController#create
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        render :json => {user: @user}
      else
        render :json => {}, :status => 401
      end
    end
  end

  def destroy
    sign_out
    render :json => {}, :status => 200
  end

  def options
    set_access_control_headers
    head :ok
  end

end
