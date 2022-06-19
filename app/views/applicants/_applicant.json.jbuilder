json.extract! applicant, :id, :name, :vacancy_id, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
