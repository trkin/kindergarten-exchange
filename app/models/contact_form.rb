class ContactForm
  include ActiveModel::Model
  attr_accessor :name, :email, :question
  validates :name, :email, :question, presence: true
end
