class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" mail@archi-testguru.heroku.com>}
  layout 'mailer'
end
