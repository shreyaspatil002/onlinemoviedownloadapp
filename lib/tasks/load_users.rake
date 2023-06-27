namespace :db do 
    task :load_users => :environment do 
        puts "im in rake tasks "
        User.create({email: "test2@gmail.com", password: "test@123", password_confirmation: "test@123"})
        User.create({email: "test3@gmail.com", password: "test@123", password_confirmation: "test@123"})
    end
end