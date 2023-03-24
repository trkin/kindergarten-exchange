# frozen_string_literal: true

class WishGroup < ApplicationRecord
  belongs_to :wish
  belongs_to :group
end
