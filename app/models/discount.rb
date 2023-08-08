# frozen_string_literal: true

class Discount < ApplicationRecord
  validates :code, presence: true, uniqueness: true
end
