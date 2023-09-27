json.array! @opens do |open|
  json.(open, :id, :created_at, :updated_at, :open_type, :request_ip, :user_agent)
end
