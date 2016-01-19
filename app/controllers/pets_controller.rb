class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pets = Pet.all
  end

  def new
    @user = User.find_by_id(params[:user_id])
    @pet = @user.pets.new
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @pet = @user.pets.new(pet_params)
    if @pet.save && @user == current_user
      flash[:notice] = 'Pet added successfully'
      redirect_to user_path(@user)
    else
      flash[:alert] = "Sorry, something went wrong."
      render 'new'
    end

  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @pet = Pet.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:user_id])
    @pet = Pet.find_by_id(params[:id])
    if @pet.update_attributes(pet_params) && @user == current_user
      flash[:notice] = 'Pet added successfully'
    else
      flash[:alert] = "Sorry, something went wrong."
    end
    redirect_to user_path(@user)
  end

  def destroy
    @pet = Pet.find_by_id(params[:id])
    if @pet.user_id == current_user.id
      @pet.destroy
      flash[:notice] = 'Pet deleted successfully'
    else
      flash[:alert] = "Sorry, something went wrong."
    end
    redirect_to user_path(current_user)
  end

  def info
    @pet = Pet.find_by_id(params[:id])
    if @pet
      render json: @pet
    else
      render status: 404, json: {error: "No info"}
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :age, :avatar)
  end

end
