if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_my_tracking_app', domain: 'https://tracking-app-yoco.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_my_tracking_app'
end
