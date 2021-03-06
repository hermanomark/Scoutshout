class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :nationality, 
        :height, :bust, :waist, :hips, :eye_color, :shoe_size, :hair_color, :facebook, :instagram, 
        :linkedin, :twitter, :picture])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :nationality, 
        :height, :bust, :waist, :hips, :eye_color, :shoe_size, :hair_color, :facebook, :instagram, 
        :linkedin, :twitter, :picture])
    end
end