class Category < ApplicationRecord
  belongs_to :user
  has_many :spends
  has_many :category_spends, through: :spends

  has_one_attached :icon

  validates :name, uniqueness: true, presence: true
  validates :icon, presence: true
end
