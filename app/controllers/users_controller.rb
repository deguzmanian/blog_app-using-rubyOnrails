class UsersController < ApplicationController
  skip_before_action :authorized
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,:password))
    session[:user_id] = @user.id
    @user.admin = 0
    redirect_to '/welcome'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to '/welcome'
    end
  end

  private
    def user_params
        params.require(:user).permit(:username, :password, :fname, :lname, :birthday, :address)
    end
end
