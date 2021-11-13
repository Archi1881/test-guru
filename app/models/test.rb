class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates_uniqueness_of :title, scope: :level
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }
  scope :category, ->(c_title) { joins(:category)
    .where(categories: {title: c_title}) }

  def self.desc_category_title
  	order(title: :desc).pluck(:title)
  end
end
