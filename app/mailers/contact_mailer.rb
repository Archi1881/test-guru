class ContactsMailer < ApplicationMailer
  def contact_form(email, message)
    @email = email
    @message = message

    mail to: 'mail@testguru.com'
  end
end