class Test < ApplicationRecord
  belongs_to :category
  has_many :qustions
  has_many :user
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  def self.desc_category_title(category_title)
  	joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: category_title}).order(title: :desc).pluck(:title)
  end
end
