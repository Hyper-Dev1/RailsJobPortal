# app/controllers/admin/companies_controller.rb
module Admin
    class CompaniesController < ApplicationController
      layout "admin"  # Specify the layout here
      def index
        @companies = Company.all
      end
  
      def new
        @company = Company.new
      end
  
      def create
        @company = Company.new(company_params)
        if @company.save
          redirect_to admin_companies_path, notice: 'Company created successfully!'
        else
          render :new
        end
      end
  
      def edit
        @company = Company.find(params[:id])
      end
  
      def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
          redirect_to admin_companies_path, notice: 'Company updated successfully!'
        else
          render :edit
        end
      end
  
      def destroy
        @company = Company.find(params[:id])
        @company.destroy
        redirect_to admin_companies_path, notice: 'Company deleted successfully!'
      end
  
      private
  
      def company_params
        params.require(:company).permit(:name, :email, :website, :password_digest, :contactPerson, :phoneNumber)
      end
    end
  end
  