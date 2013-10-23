class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #rescue_from ActiveRecord::RecordNotFound, with: :page_not_found
  #rescue_from ActionController::RoutingError, with: :page_not_found

  def raise_not_found!
    raise ActionController::RoutingError.new("Page not found")
  end

private

  def page_not_found
    flash[:error] = "Sorry, that page doesn't exist."
    redirect_to root_path
  end

  def user_not_authorized
    flash[:error] = "You do not have the proper permission to do this action"
    redirect_to request.headers["Referer"] || root_path
  end

end
