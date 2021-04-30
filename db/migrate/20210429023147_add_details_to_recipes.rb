class AddDetailsToRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :title, :text
    add_column :recipes, :image, :text
    add_column :recipes, :user_id, :integer
  end
end
