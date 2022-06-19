class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #relacionamento entre company e vacancy (many-to-one)
  has_many :vacancies
  #validaçoes dos dados
  validates :name, presence: true
  validates :description, length: { minimum: 3, maximum: 1000 }, presence: true
end
