class AddIndexesToTests < ActiveRecord::Migration[6.1]
  def change
    #add_index :tests, :author_id
    #add_index :tests, :category_id
    add_index :tests, %i[title level], unique: true
  end
end
