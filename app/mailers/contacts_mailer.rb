class ContactsMailer < ApplicationMailer
  def send_contact(email, message)
    @email = email
    @message = message

    mail to: 'mail@archi-testguru.heroku.com'
  end
end