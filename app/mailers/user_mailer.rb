class UserMailer < ApplicationMailer
  def contact(contact)
    mail(from: "mail_sender@gmail.com", to: contact.email, body: contact.text, subject: "Email from User")
  end
end
