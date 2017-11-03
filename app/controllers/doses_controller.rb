class DosesController < ApplicationController
  def new
    find_cocktail
    all_ingredients
    @dose = Dose.new
  end

  def create
    find_cocktail
    @dose = @cocktail.doses.create(doses_params)
    if @dose.save
      redirect_to "/cocktails/#{@cocktail.id}"
    else
      render :new
    end


  end

  def destroy
    find_dose
    id = @dose.cocktail_id
    @dose.destroy
    redirect_to "/cocktails/#{id}"

  end


  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def all_ingredients
    @ingredients = Ingredient.all.map {|i| "#{i.id} #{i.name} "}
  end
end
