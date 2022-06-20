class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,         
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable

          
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test"
  has_many :gists, dependent: :destroy

  validates :email, presence: true 
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 
    
  def all_tests(level_test)
    tests.where(level: level_test)
  end
  
  def test_passage(test)
    test_passages.find_by(test: test)
  end
  
  def admin?
    is_a?(Admin)
  end

end
