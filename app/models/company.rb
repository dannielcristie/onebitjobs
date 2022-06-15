class Company < ApplicationRecord
  #relacionamento entre company e vacany (many-to-one)
  has_many :vacancies
  #validaçoes dos dados
  validates :name, presence: true
  validates :description, length: { minimum: 3, maximum: 1000 }, presence: true
end
