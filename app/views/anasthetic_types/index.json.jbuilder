json.array!(@anasthetic_types) do |anasthetic_type|
  json.extract! anasthetic_type, :id
  json.url anasthetic_type_url(anasthetic_type, format: :json)
end
