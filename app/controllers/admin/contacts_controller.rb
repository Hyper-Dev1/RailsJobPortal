# app/controllers/admin/contacts_controller.rb
module Admin
    class ContactsController < ApplicationController
      layout "admin"  # Specify the layout here
      def index
        @contacts = Contact.all
      end
  
      def show
        @contact = Contact.find(params[:id])
      end
  
      def new
        @contact = Contact.new
      end
  
      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          redirect_to admin_contacts_path, notice: 'Message submitted successfully!'
        else
          render :new
        end
      end
  
      def edit
        @contact = Contact.find(params[:id])
      end
  
      def update
        @contact = Contact.find(params[:id])
        if @contact.update(contact_params)
          redirect_to admin_contacts_path, notice: 'Message updated successfully!'
        else
          render :edit
        end
      end
  
      def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy
        redirect_to admin_contacts_path, notice: 'Message deleted successfully!'
      end
  
      private
  
      def contact_params
        params.require(:contact).permit(:name, :email, :subject, :description)
      end
    end
  end
  