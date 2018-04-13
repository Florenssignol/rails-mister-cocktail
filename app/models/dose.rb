class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true, allow_nil: false
  validates :ingredient, uniqueness: {scope: :cocktail_id}

    attr_accessor :number
end
