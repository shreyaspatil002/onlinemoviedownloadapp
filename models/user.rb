# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # assosiations
  has_one :profile, dependent: :destroy

  # nasted form
  accepts_nested_attributes_for :profile, allow_destroy: true
  def admin?
    role == 'admin'
  end
  def manager?
    role == 'manager'
  end
end
