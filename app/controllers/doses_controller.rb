class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    if @dose.save
      @dose.ingredient = Ingredient.find(dose_params[:ingredient_id])
      @dose.cocktail = Cocktail.find(dose_params[:cocktail_id])
      redirect_to @dose.cocktail, notice: "Succes, dose added"
    else
      render :new, notice: "Didn't work, try again"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to dose_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
