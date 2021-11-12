class User < ApplicationRecord
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true
  
	def  all_test(level_test)
    Test.joins("INNER JOIN users_test ON test.id = users_test.test_id").where(level: level_test, users_tests: {user_id: id})
  end
end
