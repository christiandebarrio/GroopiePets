class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @user = current_user
    @pet = @user.pets.new
  end

  def create
    @user = current_user
    @pet = @user.pets.create(pet_params)
    if @pet
      flash[:notice] = 'Pet added successfully'
      redirect_to root_path
    else
      flash[:alert] = "Sorry, something went wrong."
      render 'new'
    end

  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :age)
  end
end
