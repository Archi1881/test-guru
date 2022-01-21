class GistQuestionService

  def initialize(question, client: client_octokit)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.data[:html_url].present?
  end

  private

  def gist_params
    {
      public: true,  
      description: "The question about #{@test.title} from TestGuru",      
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
  
  def client_octokit
    Octokit::Client.new(access_token: ENV['GIT_TOKEN'])
  end
end