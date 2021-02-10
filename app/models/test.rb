class Test < ApplicationRecord
  belongs_to :category

  def desc_category_title
    category.order(title: :desc).pluck(:title)
  end
end
