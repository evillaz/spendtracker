class Category < ApplicationRecord
  belongs_to :user
  has_many :spends
  has_many :category_spends, through: :spends

  has_one_attached :icon

  validates :name, :icon, presence: true

  validate :unique_name_per_user

  private

  def unique_name_per_user
    existing_category = Category.find_by(name: name, user_id: user_id)

    if existing_category && existing_category.id != id
      errors.add(:name, "has already been taken by another category of the same user.")
    end
  end
end
