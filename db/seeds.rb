User.destroy_all
u1 = User.create :email => 'jonesy@ga.co', :password => 'chicken'
u2 = User.create :email => 'craigsy@ga.co', :password => 'chicken'
puts "#{ User.count } users"

Ingredient.destroy_all
i1 = Ingredient.create :title => 'Eggs'
i2 = Ingredient.create :title => 'Oranges'
i3 = Ingredient.create :title => 'Flour'
i4 = Ingredient.create :title => 'Potatoes'
i5 = Ingredient.create :title => 'Honey'
i6 = Ingredient.create :title => 'Thyme'
i7 = Ingredient.create :title => 'Chicken Breast'
i8 = Ingredient.create :title => 'Red Snapper'
i9 = Ingredient.create :title => 'Apple Cider Vinegar'
i10 = Ingredient.create :title => 'Olive Oil'
i11 = Ingredient.create :title => 'Lentils'
i12 = Ingredient.create :title => 'Almonds'
i13 = Ingredient.create :title => 'White Wine'
i14 = Ingredient.create :title => 'Almond Milk'
puts "#{ Ingredient.count } ingredients"

Category.destroy_all
c1 = Category.create :name => 'Dairy'
c2 = Category.create :name => 'Fruit'
c3 = Category.create :name => 'Baking'
c4 = Category.create :name => 'Vegitable'
c5 = Category.create :name => 'Sweeteners'
c6 = Category.create :name => 'Spices'
c7 = Category.create :name => 'Meats'
c8 = Category.create :name => 'Fish and Seafood'
c9 = Category.create :name => 'Condiments'
c10 = Category.create :name => 'Oils'
c11 = Category.create :name => 'Legumes'
c12 = Category.create :name => 'Nuts'
c13 = Category.create :name => 'Alcohol'
c14 = Category.create :name => 'Dairy Alternatives'
puts "#{ Category.count } categories"


# Associations #################################################################

puts "categories and ingredients"
c1.ingredients << i1
c2.ingredients << i2
c3.ingredients << i3
c4.ingredients << i4
c5.ingredients << i5
c6.ingredients << i6
c7.ingredients << i7
c8.ingredients << i8
c9.ingredients << i9
c10.ingredients << i10
c11.ingredients << i11
c12.ingredients << i12
c13.ingredients << i13
c14.ingredients << i14
