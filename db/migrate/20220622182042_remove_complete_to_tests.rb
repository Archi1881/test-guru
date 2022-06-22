class RemoveCompleteToTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :completed, :boolean, null: false, default: false
  end
end
