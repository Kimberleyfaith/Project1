class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
