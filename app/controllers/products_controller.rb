class ProductsController < ApplicationController
    before_action :load_product, only: ['edit', 'update', 'show', 'destroy', 'download_pdf']
    before_action :authenticate_user!, except: [:index]
   # layout 'new_layout' #appiled for all
    layout 'new_layout', except: [:index]
   
        def index
            # @product= policy_scope(Product).all
            @products= if params[:q] && !params[:q].blank?   
                Product.matching(params[:q])
            else 
                Product.all.paginate(page: params[:page], per_page: 2)
            end
          
        end 
        def new
            @product = Product.new
        end
        def create
            @product =Product.new(product_params)
            authorize @product
            if @product.save
                ProductMailer.notify_product_creation(@product.id).deliver_now
                redirect_to products_path, notice: 'product created !!!'
            else
                render 'new'
            end
        end
     
        def edit 
            authorize @product
        end
        def update
          
            if @product.update(product_params)
                redirect_to products_path, notice: 'product updated !!!'
            else
                render 'edit'
            end 
        end
        def show
            
        end
        def destroy
            authorize @product
            @product.destroy
            redirect_to products_path, notice: 'product deleted !!!'
        end  
        def download_pdf
            
            send_file("#{Rails.root}/public/test1.txt",
                        filename: "test1.txt",
                        type: "application/txt")
        end
        def self.disable_all
            update_all(is_active: false)
        end
        private  
        def product_params
            params.require(:product).permit(:name, :code, :price, :is_active, :description, :cover_image)
        end    
        def load_product
            @product =Product.find(params[:id])
        end
end   
