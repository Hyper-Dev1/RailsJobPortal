# app/controllers/api/v1/companies_controller.rb
module Api
    module V1
      class CompaniesController < ApplicationController
        def index
          @companies = Company.all
          render json: @companies
        end
  
        def show
          @company = Company.find(params[:id])
          render json: @company
        end
  
        def create
          @company = Company.new(company_params)
          if @company.save
            render json: @company, status: :created
          else
            render json: @company.errors, status: :unprocessable_entity
          end
        end
  
        def update
          @company = Company.find(params[:id])
          if @company.update(company_params)
            render json: @company
          else
            render json: @company.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @company = Company.find(params[:id])
          @company.destroy
          head :no_content
        end
  
        private
  
        def company_params
          params.require(:company).permit(:name, :email, :website, :password_digest, :contactPerson, :phoneNumber)
        end
      end
    end
  end
  