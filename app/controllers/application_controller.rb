class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

    def after_sign_in_path_for(resource)
        if user_signed_in?
          products_path
        else
          new_user_session_path
        end    
    end
end
