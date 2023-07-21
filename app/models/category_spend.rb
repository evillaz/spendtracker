class CategorySpend < ApplicationRecord
  belongs_to :spend
  belongs_to :category
end
