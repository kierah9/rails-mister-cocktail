class DosesController < ApplicationController

  before_action :set_cocktail, only: [:create, :new]
  # CRUD
  # Create
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_url(@cocktail)
    else
      render :new
    end
  end
  # Destroy

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, ingredient_id)
  end
end
