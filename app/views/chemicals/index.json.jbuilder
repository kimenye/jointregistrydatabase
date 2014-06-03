json.array!(@chemicals) do |chemical|
  json.extract! chemical, :id
  json.url chemical_url(chemical, format: :json)
end
