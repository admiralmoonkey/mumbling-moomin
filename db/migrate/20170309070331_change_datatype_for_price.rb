class ChangeDatatypeForPrice < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :price, :decimal
  end

  def down
    change_column :products, :price, :float
  end
end
