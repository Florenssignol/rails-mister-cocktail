class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    # @number = params[:cocktail][:number].to_i
    @ingredients = Ingredient.all
  end

  def create
    final_params = dose_params
    @cocktail = Cocktail.find(params[:cocktail_id])
    # final_params[:number].to_i.times do |i|
    #   @dose = Dose.new(
    #     amount: final_params["amount #{i}"],
    #     description: final_params["description #{i}"],
    #     ingredient_id: final_params["id #{i}"],
    #     cocktail: @cocktail
    #   )
      if !@dose.save
        render :new
      end
    end
    redirect_to cocktails_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path, notice: "This dose has been deleted."
  end

 private
  def dose_params
    params.require(:other).permit!
  end
end
