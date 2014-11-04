class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, except: [:index]

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def enable_devise
  	@resource_name = resource_name
  	resource
  	devise_mapping
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
end
