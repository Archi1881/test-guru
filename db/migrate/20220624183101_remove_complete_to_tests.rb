class RemoveCompleteToTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :completed
  end
end
