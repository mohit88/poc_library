class LoginController < ApplicationController
  def index
  end

  def authentication
    @user = User.where(email: params[:email_id]).first
    redirect_to @user ? user_books_path(@user) : login_index_path
  end
end
