class ContactForm
  include ActiveModel::Model

  FIELDS = %i[email text]
  attr_accessor :current_user, *FIELDS

  validates_format_of :email, with: Devise.email_regexp
  validates :text, length: {minimum: 50}
  validates(*FIELDS, presence: true)

  def save
    return false unless valid?
    true
  end
end
