class ChangeReviewDatatypes < ActiveRecord::Migration[5.0]
  def up
    change_column :comments, :user_id, :integer
    change_column :comments, :product_id, :integer
    change_column :comments, :rating, :integer
    change_column :comments, :review, :text
  end

  def down
    change_column :comments, :user_id, :string
    change_column :comments, :product_id, :string
    change_column :comments, :rating, :string
    change_column :comments, :review, :string
  end
end
