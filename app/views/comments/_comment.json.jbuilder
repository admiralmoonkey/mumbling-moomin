json.extract! comment, :id, :user_id, :product_id, :review, :rating, :created_at, :updated_at
json.url comment_url(comment, format: :json)