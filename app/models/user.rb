class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true
  
	def user_tests(test)
    user_tests.order(id: :desc).find_by(test: test)
  end
end
