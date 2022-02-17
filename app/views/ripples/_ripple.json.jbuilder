json.extract! ripple, :id, :name, :posted, :message, :url, :created_at, :updated_at
json.url ripple_url(ripple, format: :json)
