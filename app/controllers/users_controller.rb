class UsersController < ApplicationController
   before_action :require_user_logged_in, only: [:show, :edit]
  
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'success'
      redirect_to @user
    else
      flash.now[:danger] = 'fail'
      render :new
    end
  end
  
  def edit
#    @user = User.find(params[:id])
    @user = current_user
  end
  
   def update
#    @user = User.find(params[:id])
    @user = current_user

    if @user.update(user_params)
      flash[:success] = 'success'
      redirect_to @user
    else
      flash.now[:danger] = 'fail'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :e_mail, :password, :password_confirmation, :comment, :detail, :image)
  end
end

