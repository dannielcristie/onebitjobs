json.extract! applicant, :id, :name, :vacany_id, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
