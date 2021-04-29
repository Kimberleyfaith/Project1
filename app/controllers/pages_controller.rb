class PagesController < ApplicationController
  before_action :check_for_login
  def index
          @recipe = Recipe.new
          @recipe.ingredients.build
  end
end
