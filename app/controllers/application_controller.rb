class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate!

  private

  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_doctor_root_path
  end

  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    appointments_path 
  end

  def authenticate!
    unless doctor_signed_in? || patient_signed_in?
      redirect_to home_index_path
    end
  end

  def after_sign_up_path_for(resource)
    appointments_path
  end
end
