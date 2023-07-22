class RemoveIconToCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :icon, :string, if_exists: true
  end
end
