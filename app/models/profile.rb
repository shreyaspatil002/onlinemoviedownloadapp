# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true, uniqueness: true
end
