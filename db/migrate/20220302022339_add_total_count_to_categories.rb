class AddTotalCountToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :total_count, :integer, default: 0
  end
end
