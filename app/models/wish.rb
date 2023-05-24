class Wish < ApplicationRecord
  belongs_to :user
  belongs_to :kindergarten

  has_many :wish_kindergartens, dependent: :destroy

  enum :group, %w[age1 age2 age3 age4 age5 age6]
end
