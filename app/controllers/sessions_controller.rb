class SessionsController < ApplicationController
  def new
  end

  def create
    e_mail = params[:session][:e_mail].downcase
    password = params[:session][:password]
    if login(e_mail, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(e_mail, password)
    @user = User.find_by(e_mail: e_mail)
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