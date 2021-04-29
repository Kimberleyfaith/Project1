class RecipesController < ApplicationController

  # Search recipes by ingredients
  def index

      require 'uri'
      require 'net/http'
      require 'openssl'

      url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=#{params[:ingredients]}&number=3&ignorePantry=true&ranking=2")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = ENV["SPOONACULAR_API_KEY"] #hidden API key
      request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

      response = http.request(request)
      @search_results = JSON.parse response.read_body

      puts response.read_body
  end

  # show recipes - title and image + ingredients and method
  def show

      url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{params[:id]}/information")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = ENV["SPOONACULAR_API_KEY"] #hidden API key
      request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

      response = http.request(request)
      @recipe = JSON.parse response.read_body

      p url_ingredients = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{params[:id]}/ingredientWidget.json")

      http_ingredients = Net::HTTP.new(url_ingredients.host, url_ingredients.port)
      http_ingredients.use_ssl = true
      http_ingredients.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request_ingredients = Net::HTTP::Get.new(url_ingredients)
      request_ingredients["x-rapidapi-key"] = ENV["SPOONACULAR_API_KEY"]
      request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

      response_ingredients = http.request(request_ingredients)
      # puts response_ingredients.read_body
      @ingredients = JSON.parse response_ingredients.read_body
      p "RECIPES"
      # p @recipe
      p "INGREDIENTS"
      p @ingredients

  end

  # add recipe to 'My Recipe' folder - title and image
  def add
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{params[:recipe_id]}/information")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV["SPOONACULAR_API_KEY"] #hidden API key
    request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

    response = http.request(request)
    recipe_data = JSON.parse response.read_body
    recipe = Recipe.create :title => recipe_data["title"], :image => recipe_data["image"]
    @current_user.recipes << recipe # add recipe to My Recipes

    redirect_to my_recipes_path
  end

  def my_recipes
      @recipes = @current_user.recipes
  end

  end
