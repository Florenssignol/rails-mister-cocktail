class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    puts params
     @dose = Dose.new(dose_params)
     @cocktail = Cocktail.find(params[:cocktail_id])
     @dose.cocktail = @cocktail

    if @dose.save
     redirect_to dose_path
    else
     render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path, notice: "This dose has been deleted."
  end

 private
  def dose_params
    params.require(:dose).permit(:amount, :desription, :ingredient_id)
  end
end
