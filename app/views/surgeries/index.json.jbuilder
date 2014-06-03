json.array!(@surgeries) do |surgery|
  json.extract! surgery, :id, :patient_id, :surgeon_id, :date_of_surgery, :side, :anasthetic_type_id, :chemical_id, :mechanical_id, :implant_indication_id
  json.url surgery_url(surgery, format: :json)
end
