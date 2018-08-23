class Product < ApplicationRecord
  belongs_to :category

  validates :description, :price, :category, presence: true
end
