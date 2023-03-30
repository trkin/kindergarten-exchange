class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :email, if: :email_required?
  validates_format_of :email, with: email_regexp, allow_blank: true
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: password_length, allow_blank: true
end
