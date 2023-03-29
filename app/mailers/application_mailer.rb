class ApplicationMailer < ActionMailer::Base
  default from: 'one@mail.com'
  layout "mailer"
end
