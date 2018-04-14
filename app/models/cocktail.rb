class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  accepts_nested_attributes_for :doses
  validates :name, presence: true, uniqueness: true

  attr_accessor :number
end
