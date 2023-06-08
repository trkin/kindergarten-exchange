class Wish < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :kindergarten

  has_many :kindergartens, through: :wish_kindergartens
  has_many :wish_kindergartens, dependent: :destroy

  enum group: {age1: "age1", age2: "age2", age3: "age3", age4: "age4", age5: "age5", age6: "age6"}

  validates :kindergarten_id, presence: true
  validates :group, presence: true
end
