json.extract! message, :id, :email, :messages, :created_at, :updated_at
json.url message_url(message, format: :json)
