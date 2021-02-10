class User < ApplicationRecord
	def test_passage(test)
    test.order(id: :desc).find_by(test: test)
  end
end
