class UsersController < ApplicationController
  skip_before_action :authorized
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:email,:password))
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

  def show_users
    @users = User.where.not(id:session[:user_id]).paginate(page: params[:page], per_page: 10).order('lname ASC')
  end

  def set_admin_permission
    @user = User.find(params[:id])
    @user.update_column(:admin, 1)
    redirect_to '/users/users_account_list'
  end

  def remove_admin_permission
    @user = User.find(params[:id])
    @user.update_column(:admin, 0)
    redirect_to '/users/users_account_list'
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :fname, :lname, :birthday, :address)
    end
end