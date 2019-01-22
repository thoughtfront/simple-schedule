Clearance.configure do |config|
  config.mailer_sender = "no_reply@simpleschedule.thoughtfront.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.user_model = Core::User
  config.cookie_name = "tf_simsched_rt"
end
