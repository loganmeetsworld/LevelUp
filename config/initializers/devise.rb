Devise.setup do |config|
  # I want to be able to style my own views
  config.scoped_views = true
  
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  #Add your ID and secret here
  #ID first, secret second
  config.omniauth :github, "02d85bd22ce73e416ae2", "98e6c1bcc6aee0f624d82f4fc17110cab02ccd5d"
end