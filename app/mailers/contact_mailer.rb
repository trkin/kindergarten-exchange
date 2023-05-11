class ContactMailer < ApplicationMailer
  default from: -> { contact_form_email }

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(to: "kindergarten@example.com", subject: 'New contact form submission')
  end

  private

  def contact_form_email
    @contact_form.email if @contact_form.present?
  end
end
