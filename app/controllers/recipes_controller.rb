class RecipesController < ApplicationController


    def index

      require 'uri'
      require 'net/http'
      require 'openssl'

      url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=#{params[:ingredients]}&number=3&ignorePantry=true&ranking=1")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = ENV["SPOONACULAR_API_KEY"]
      request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

      response = http.request(request)
      @search_results = JSON.parse response.read_body

    puts response.read_body
    end

    def show

      url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{params[:id]}/information")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = ENV["SPOONACULAR_API_KEY"]
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

  end
