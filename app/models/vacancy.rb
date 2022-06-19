class Vacancy < ApplicationRecord
  #relaciomento entre vacancy com company e vacancy com applicants (many-to-one)
  belongs_to :company
  has_many :applicants
  #validaçoes dos dados
  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 3, maximum: 1000 }, presence: true
  validates :requirements, presence: true
  validates :salary, presence: true
end
