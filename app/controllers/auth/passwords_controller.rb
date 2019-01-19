class Auth::PasswordsController < Clearance::PasswordsController
  respond_to :json

  def create
    if user = find_user_for_create
      user.forgot_password!
      deliver_email(user)
    end
    respond_width user
  end

  def update
    @user = find_user_for_update

    if @user.update_password password_reset_params
      sign_in @user
      session[:password_reset_token] = nil
      respond_width @user
    else
      render :json => {}, :status => 422
    end
  end
end
