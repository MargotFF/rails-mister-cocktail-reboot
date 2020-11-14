class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true

  def previous
    Cocktail.where('id < ?', id).first
  end

  def next
    Cocktail.where('id > ?', id).first
  end

end
