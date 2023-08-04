# frozen_string_literal: true

# #SCOPE
# scope :matching, ->(q) {where(name: q )} only name field

class Product < ApplicationRecord
  # USED IN CODE
  # pagination

  paginates_per 4

  validates :name, presence: true
  validates :is_active, acceptance: { message: 'must be true' } # for custom messages
  validates :name, confirmation: true
  validates :price, numericality: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :acceptable_image

  has_many :reviews , dependent: :destroy
  has_many :orderables , dependent: :destroy

  
  has_one_attached :cover_image do |img|
    img.variant :thumb, resize_to_limit: [500, 500]
  end
  

  scope :matching, ->(q) { where('name LIKE :q OR code = :q', q: q) }

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
    if cover_image.attached?
      errors.add(:cover_image, 'is too big') unless cover_image.byte_size <= 1.megabyte
  
      acceptable_types = ['image/jpeg', 'image/png', 'image/webp']
      unless acceptable_types.include?(cover_image.content_type)
        errors.add(:cover_image, 'must be a JPEG or PNG')
      end
    else
      # Attach a default image if no cover image is attached
      default_image_path = Rails.root.join('app', 'assets', 'images', 'imagenotfound.png')
      cover_image.attach(io: File.open(default_image_path), filename: 'imagenotfound.png', content_type: 'image/png')
    end
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
