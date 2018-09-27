class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = 'success'
      redirect_to root_url
    else
      flash.now[:danger] = 'fail'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'success'
    redirect_to root_url
  end

  private

  def login(name, password)
    @user = User.find_by(name: name)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end