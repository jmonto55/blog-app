class ApplicationController < ActionController::Base
  def current_user
    User.first
  end
end
