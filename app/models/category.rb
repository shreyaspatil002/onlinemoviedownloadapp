class Category < ApplicationRecord
    validates :name, presence: true 

    #you can provide any name instade of main_image 
    #has_one_attached :main_image
    #create diffrent variant
    has_one_attached :main_image do |img|
        img.variant :thumb, resize_to_limit: [100,100]
    end 
    validate :acceptable_image
    def acceptable_image
        return false unless main_image.attached?
        unless main_image.byte_size <= 1.megabyte
            errors.add(:main_image, "is too big")
        end

        acceptable_types =["image/jpeg","image/png"]
        unless acceptable_types.include?(main_image.content_type)
            errors.add(:main_image, "must be a JPGE or PNG")
        end 
    end 
        
    
end
