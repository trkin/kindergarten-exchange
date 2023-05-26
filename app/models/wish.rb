class Wish < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :kindergarten

  has_many :kindergartens, through: :wish_kindergartens
  has_many :wish_kindergartens, dependent: :destroy

  enum group: { group1: "age1", group2: "age2", group3: "age3", group4: "age4", group5: "age5" }
end
