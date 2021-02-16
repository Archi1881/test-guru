class User < ApplicationRecord
	has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
	def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
