class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    #   @images = [ "footer3.jpg" ,"title3.jpg",  "title2.jpg"]
    # @rand_image = @images[rand(images.size)]
    # @rand_image
    find_cocktail
    all_ingredients
    @dose = Dose.new


  end


  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = cocktail_params
    new_cocktail = Cocktail.create(cocktail_params)
    @cocktail = new_cocktail
    if @cocktail.save
      redirect_to "/cocktails/#{new_cocktail.id}"
    else
      render :new
    end

  end

private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
  def all_ingredients
    @ingredients = Ingredient.all.map {|i| "#{i.id} #{i.name} "}
  end

end
