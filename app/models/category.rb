class Category < ApplicationRecord
  belongs_to :user
  has_many :spends
  has_many :category_spends, through: :spends

  validates :name, :icon, presence: true
end
