namespace :db do 
    task :disable_allproducts_ => :environment do 
        puts "im in rake tasks disable"

        Product.disable_all
    
    end
end