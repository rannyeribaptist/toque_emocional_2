json.extract! user, :id, :name, :segment, :city, :state, :created_at, :updated_at
json.url user_url(user, format: :json)
