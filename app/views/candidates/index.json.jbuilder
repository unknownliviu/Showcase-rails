json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :sex, :university
  json.url candidate_url(candidate, format: :json)
end
