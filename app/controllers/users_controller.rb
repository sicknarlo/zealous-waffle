class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_hash)
    if @user.save
      flash[:success] = "New User Created"
      redirect_to users_path
    else
      flash[:error] = "Error: New User Not Created"
      render :new
    end
  end

  private

  def params_harsh
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end