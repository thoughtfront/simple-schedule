class Auth::SessionsControllerController < Clearance::SessionsController
  respond_to :json

  # Override Clearance::SessionsController#create
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        respond_width @user
      else
        render :json => {}, :status => 401
      end
    end
  end

  def destroy
    sign_out
    render :json => {}, :status => 200
  end

end
