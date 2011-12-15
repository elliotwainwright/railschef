class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
  @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def create
    @recipe = Recipe.create(params[:recipe])
    flash[:notice] = "Recipe Created"
    redirect_to root_url
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.save
      @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Recipe Updated"
      redirect_to @recipe
    else
      flash[:notice] = "Epic Fail"
      redirect_to edit_recipe_path
    end
  end

  def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.delete
      redirect_to recipes_path
  end
  
end
