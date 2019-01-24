module Authorization
  extend Clearance::Authorization

  # Override lib/clearance/authorization
  def deny_access(message)
    render :json => {msg: message}, :status => 401
  end

end