json.extract! vacancy, :id, :title, :location, :description, :requirements, :salary, :avaliable, :company_id, :created_at, :updated_at
json.url vacancy_url(vacancy, format: :json)
