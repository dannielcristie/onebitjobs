class Applicant < ApplicationRecord
  #relacionamento entre applicants com vacany
  belongs_to :vacany
  #validaçoes dos dados
  validades :name, presence: true
end
