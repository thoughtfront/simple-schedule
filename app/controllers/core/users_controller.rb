class Core::UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      respond_with @user
    else
      render :json => {}, :status => 422
    end
  end
end
