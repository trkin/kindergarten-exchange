class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mailer_sender
  layout "mailer"
end
