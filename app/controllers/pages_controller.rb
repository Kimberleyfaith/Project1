class PagesController < ApplicationController
  def index
          @recipe = Recipe.new
          @recipe.ingredients.build
  end
end
