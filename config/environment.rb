# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
JoshIntranet::Application.initialize!
  ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'niwantintranet.com',
    user_name:            'niwant.techvision@gmail.com',
    password:             'namv1234',
    authentication:       'plain',
    enable_starttls_auto: true }

  Date::DATE_FORMATS.merge!(:default => "%d/%m/%Y")
