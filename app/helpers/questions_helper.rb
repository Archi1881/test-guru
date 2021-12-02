module QuestionsHelper
    def question_header(question)
      test_title = question.test.title
    question.persisted? ? "Edit #{test_title} question" : "Create new question for test: #{test_title}"
      end
end
