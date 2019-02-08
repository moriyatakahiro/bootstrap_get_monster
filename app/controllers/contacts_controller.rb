class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :edit]

 
  def index
    @contacts = Contact.all
  end

  
  def show
  end

  
  def new
    @property_id = params[:properties_id]
      if params[:back]
        @contact = Contact.new(contact_params)
      else
        @contact = Contact.new
      end
  end

 
  def create
    @contact = Contact.new(contact_params)
    @property = Property.find(params[:property_id])
      if @contact.save
        ContactMailer.contact_mail(@contact, @property).deliver
        flash[:notice] = "メールを送信しました"
        redirect_back(fallback_location: root_path)
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
