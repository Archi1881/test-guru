class TestPassage < ApplicationRecord
  POSITIVE_SCORE = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question
  scope :passed, -> { where('score >= ?', POSITIVE_SCORE) }

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def update_successfull
    update(successfull: true)
  end

  def passed?
    result >= SUCCESS_PERCENT
  end

  def result
    ((self.correct_questions.to_f / test.questions.count.to_f) * 100).to_i
  end

  def completed?
    current_question.nil?
  end

  def index_current_question
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

=begin
  def current_question_number
    current_question_index + 1
  end
=end

  def score
    (correct_questions.to_f * 100) / (test.questions.size)
  end

  def score_positive?
    score >= POSITIVE_SCORE
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first
      # debugger
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end