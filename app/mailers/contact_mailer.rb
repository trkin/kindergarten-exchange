class ContactMailer < ApplicationMailer
  default from: Rails.application.credentials.mailer_sender

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(to: "example@gmail.com", subject: "New Contact Form Submission")
  end
end
