class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   load_and_authorize_resource
  include SessionsHelper
  include CategoriesHelper
  include PropertiesHelper
  include CategoryBrandHelper

  before_action :require_login

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end

  def set_auto_password
    return SecureRandom.urlsafe_base64.to_s 
  end
end
