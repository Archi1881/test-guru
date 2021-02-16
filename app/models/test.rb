class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions, dependent: :destroy


  def desc_category_title
    category.order(title: :desc).pluck(:title)
  end
end
