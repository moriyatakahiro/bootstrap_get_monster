class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit]

 
  def index
    @contacts = Contact.all
  end

  
  def show
  end

  
  def new
    @contact = Contact.new
  end

 
  def create
    @contact = Contact.new(contact_params)
    @property = Property.find(params[:user_id])
      if @contact.save
        ContactMailer.contact_mail(@contact, @property).deliver  
        redirect_to @contact, notice: 'メールを送信しました。'
      else
        render :new
      end
  end

  

  private
   
    def set_contact
      @contact = Contact.find(params[:id])
    end

   
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
