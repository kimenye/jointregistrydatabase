json.array!(@patients) do |patient|
  json.extract! patient, :id, :medical_record_number, :name, :date_of_birth, :gender, :weight, :height, :race, :postcode, :nhif_number
  json.url patient_url(patient, format: :json)
end
