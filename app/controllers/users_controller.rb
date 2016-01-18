class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @pets = @user.pets.all
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
