class AccountsController < ApplicationController
  before_filter :ensure_logged_in

  def show
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Your account has been deleted'
  end
end
