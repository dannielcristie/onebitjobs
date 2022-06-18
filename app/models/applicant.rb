class Applicant < ApplicationRecord
  #relacionamento entre applicants com vacany
  belongs_to :vacany
  #validaçoes dos dados
  validates :name, presence: true
end
