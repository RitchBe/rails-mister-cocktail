class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = cocktail_params

    byebug
    new_cocktail = Cocktail.create(image: params[:cocktail][:image].file_url, name: cocktail_params)
    @cocktail = new_cocktail
    if @cocktail.save
      redirect_to "/cocktails/#{new_cocktail.id}"
    else
      render :new
    end

  end

private
  def cocktail_params
    params.require(:cocktail).permit(:name, :image)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
