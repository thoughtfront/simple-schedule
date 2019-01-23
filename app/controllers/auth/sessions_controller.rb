class Auth::SessionsController < Clearance::SessionsController
  skip_before_action :verify_authenticity_token
  # include OptionsRequest
  # Override Clearance::SessionsController#create
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      puts "\n\nSESSION: #{session[:current_user_id]}\n"
      puts "\n\nUSER: #{@user.inspect}\n"
      session[:current_user_id] = @user.id
      if status.success?
        cookies["RT"] = @user.remember_token
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
