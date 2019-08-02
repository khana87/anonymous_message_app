class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to @user
    else
      flash[:error] = 'ログインできませんでした'
      redirect_to root_url
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end
  
end
