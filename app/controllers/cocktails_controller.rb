class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @ingredients = Ingredient.all

    if @cocktail.save
     redirect_to cocktail_path(@cocktail)
    else
     render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, doses_attributes: doses_params)
  end

  def doses_params
    [:id, :_destroy, :amount, :description, :ingredient_id]
  end
end
