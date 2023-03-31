class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  validates :phone,  presence: true
  validates :phone, uniqueness: { case_sensitive: false }
  validates :phone, format: { with: ::Constants::PHONE_REGEX }
  def is_admin?
    admin
  end

  protected

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end