class CocktailsController < ApplicationController

  # GET /cocktails or /cocktails.json
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1 or /cocktails/1.json
  def show
    @cocktails = Cocktail.find(params[:id])
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # # GET /cocktails/1/edit
  # def edit
  # end

  # POST /cocktails or /cocktails.json
  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to @cocktail
  end

  # # PATCH/PUT /cocktails/1 or /cocktails/1.json
  # def update

  # end

  # # DELETE /cocktails/1 or /cocktails/1.json
  # def destory

  # end

  private

  # def set_cocktail
  #   @cocktail = Cocktail.find(params[:id])
  # end

  def cocktail_params
    params.require(:restaurant).permit(:name)
  end
end
