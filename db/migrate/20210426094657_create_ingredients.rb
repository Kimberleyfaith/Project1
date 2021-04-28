class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :measurement, null: false
      t.string :description, null: false
      t.belongs_to :recipe, null: false
      t.timestamps
    end
  end
end
