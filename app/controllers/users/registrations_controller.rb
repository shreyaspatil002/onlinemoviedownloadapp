# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :sign_up_params, only: [:create]
    before_action :account_update_params, only: [:update]

    def new
      puts "\n\n...Im in your local...\n\n"
      build_resource({})
      resource.build_profile
      respond_with resource
    end

    private

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
      params.require(:user).permit(:email, :password, :password_confirmation, :role,
                                   profile_attributes: %i[id first_name last_name mobile address zip_code])
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role,
                                   profile_attributes: %i[id first_name last_name mobile address zip_code])
    end
  end
end
