class Applicant < ApplicationRecord
  #relacionamento entre applicants com vacancy
  belongs_to :vacancy
  #validaçoes dos dados
  validates :name, presence: true
  has_one_attached :curriculum
end
