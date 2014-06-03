json.array!(@mechanicals) do |mechanical|
  json.extract! mechanical, :id
  json.url mechanical_url(mechanical, format: :json)
end
