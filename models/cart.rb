class Cart < ApplicationRecord
  include DiscountPriceModule

  has_many :orderables
  has_many :products, through: :orderables

  validate :validate_age_restriction_for_books

  def total
    orderables.to_a.sum(&:total)
  end
  def age_restricted?
    @product.min_age_required.present?
  end
  private

  def validate_age_restriction_for_books
      orderables.each do |orderable|
        if orderable.product.min_age_required.present?
          puts "20"
         next unless orderable.product.age_restricted?
         puts "21"
        user= User.find_by(id: orderable.customer_id)
        # if user && user.profile&.date_of_birth
          min_age_required = orderable.product.min_age_required
          # customer_age = Time.new.year - user.profile.date_of_birth.year
          age=9
          rqage=19
          # if customer_age < min_age_required
          if age < rqage
            puts "31"
            puts( "NOT ALLOWED")

            # errors.add(:base, "You must be at least #{min_age_required} years old to purchase #{orderable.product.name}.")
          end
        end
      # end
    end
   end
 end
