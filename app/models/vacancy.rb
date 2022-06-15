class Vacancy < ApplicationRecord
  belongs_to :company
  has_many :applicants
end
