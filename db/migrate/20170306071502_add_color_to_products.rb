class AddColorToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :colour, :string
  end
end
