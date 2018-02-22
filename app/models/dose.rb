class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :ingredient, uniqueness: { scope: :cocktail }
end
