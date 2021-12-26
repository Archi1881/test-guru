require 'digest/sha1'

class User < ApplicationRecord
          
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test"

  validates :name, :email, presence: true 
  validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, uniqueness: true 

  has_secure_password
    
  def test_passage(test)
    test_passages.find_by(test_id: test.id)
  end

	
end
