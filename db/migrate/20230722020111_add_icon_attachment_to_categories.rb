class AddIconAttachmentToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :icon, :binary
  end
end
