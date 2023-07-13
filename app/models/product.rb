class Product < ApplicationRecord
    #USED IN CODE
    validates :name, presence: true 
    validates :is_active, acceptance: {message: 'must be true'} #for custom messages 
    validates :name, confirmation: true 
    validates :price, numericality: true
    validates :name, uniqueness: {case_sensitive: false }
    has_many :reviews 
    has_many :orderables
    has_many :carts, through: :orderables
    

    #pagination 
    paginates_per 2

    ##SCOPE
        # scope :matching, ->(q) {where(name: q )} only name field 
        scope :matching, ->(q) { where("name = :q OR code = :q", q: q)}

        def is_active?
            is_active==true
        end

        #CUSTOM CALLBACKS
        after_initialize do
            puts "\n Calling after_initialize callback "
        end
        #after_find :method_after_find
        # CODE OF CONDITIONAL VALIDATION we can use if, unless, proc 
        #after_commit :method_after_commit, on: [:create]
        #after_rollback :method_after_rollback
        #association
        # has_many :reviews 
        
        # #pagination 
        # paginates_per 2
        
        private 
       
        has_one_attached :cover_image do |img|
            img.variant :thumb, resize_to_limit: [100,100]
        end 
        validate :acceptable_image
        def acceptable_image
            return false unless cover_image.attached?
            unless cover_image.byte_size <= 1.megabyte
                errors.add(:cover_image, "is too big")
            end
    
            acceptable_types =["image/jpeg","image/png","image/webp"]
            unless acceptable_types.include?(cover_image.content_type)
                errors.add(:cover_image, "must be a JPGE or PNG")
            end 
        end 
         # def method_after_commit
        #     puts "\n calling after_commit method"
        # end
        # def method_after_rollback
        #     puts "\n calling after_rollback method"
        # end
        #  def method_after_find 
            
        #     puts "\n Calling after_find callback "
        
        # end
     
end
