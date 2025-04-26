Devise.setup do |config|
  # ==> Controller configuration
  # You don't need to change this unless you want to customize Devise's controller behavior.
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration (Mongoid)
  require 'devise/orm/mongoid'

  # ==> Session Configuration:
  # Ensure session storage is not skipped for API-only authentication
  config.skip_session_storage = [:http_auth]  # This ensures that session storage is used for standard login/authentication.

  # ==> CSRF token cleanup for AJAX (optional, but recommended for security)
  config.clean_up_csrf_token_on_authentication = true

  # ==> Authentication Keys
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  # ==> Rememberable settings
  # Remember me settings to allow users to stay signed in for a longer period.
  # config.remember_for = 2.weeks
  # config.expire_all_remember_me_on_sign_out = true

  # ==> Timeoutable settings
  # Set timeout period to automatically sign out users after inactivity.
  # config.timeout_in = 30.minutes

  # ==> Session Store Configuration
  # You don't need to change this unless you're dealing with additional session storage issues.

  # ==> Navigation Configuration (for React and non-API routes)
  # You can configure navigational formats for different formats such as HTML, XML, etc.
  config.navigational_formats = ['*/*', :html, :turbo_stream]

  # ==> Sign Out Configuration
  # This allows the user to log out through a DELETE request to `/users/sign_out`
  config.sign_out_via = :delete

  # ==> Warden Configuration (for advanced strategies, not typically needed unless using custom authentication)
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end
end
