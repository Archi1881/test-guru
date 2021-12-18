class Answer < ApplicationRecord
  belongs_to :Question
  
  scope :correct, -> {where(correct: true) }
end
