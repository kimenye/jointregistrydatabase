json.array!(@implant_indications) do |implant_indication|
  json.extract! implant_indication, :id
  json.url implant_indication_url(implant_indication, format: :json)
end
