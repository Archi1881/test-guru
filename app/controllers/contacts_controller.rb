class ContactsController < ApplicationController
  
  # GET /contacts or /contacts.json
  def index
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactsMailer.send_contact(@contact.email, @contact.body).deliver_now
      redirect_to root_path, notice: t('.send_mail_success')
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end