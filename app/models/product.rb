# frozen_string_literal: true
 # #SCOPE
  # scope :matching, ->(q) {where(name: q )} only name field

class Product < ApplicationRecord
  # USED IN CODE
  # pagination
  
  paginates_per 3

  validates :name, presence: true
  validates :is_active, acceptance: { message: 'must be true' } # for custom messages
  validates :name, confirmation: true
  validates :price, numericality: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :acceptable_image

  has_many :reviews
  has_many :orderables
  has_many :carts, through: :orderables
  has_many :bills
  has_one_attached :cover_image do |img|
    img.variant :thumb, resize_to_limit: [100, 100]
  end

  scope :matching, ->(q) { where('name = :q OR code = :q', q: q) }

  def is_active?
    is_active == true
  end

  # CUSTOM CALLBACKS
  # after_initialize do
  #   puts "\n Calling after_initialize callback "
  # end
  # after_find :method_after_find
  # CODE OF CONDITIONAL VALIDATION we can use if, unless, proc
  # after_commit :method_after_commit, on: [:create]
  # after_rollback :method_after_rollback

  private

  def acceptable_image

    return false unless cover_image.attached?
    errors.add(:cover_image, 'is too big') unless cover_image.byte_size <= 1.megabyte
    acceptable_types = ['image/jpeg', 'image/png', 'image/webp']
    return if acceptable_types.include?(cover_image.content_type)
    errors.add(:cover_image, 'must be a JPGE or PNG')

  end

  # def method_after_commit
  #     puts "\n calling after_commit method"
  # end
  # def method_after_rollback
  #     puts "\n calling after_rollback method"
  # end
  # def method_after_find
  #     puts "\n Calling after_find callback "
  # end

end
