class User < ApplicationRecord
  #has_many :user_tests
  #has_many :tests, through: :user_tests
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true
  
  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end

	def all_tests(level_test)
    tests.where(level: level_test)
  end
end
