class RenameColorsInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :colour, :color
  end
end
