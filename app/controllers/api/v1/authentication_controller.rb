module Api
    module V1
      class AuthenticationController < Api::V1::ApplicationController
        before_action :authorize_request, except: [:login, :register]
  
        # 🚀 Register a new Company
        def register
          company = Company.new(company_params)
          if company.save
            token = JsonWebToken.encode(company_id: company.id.to_s)
            render json: { token: token, company: company.as_json(except: [:encrypted_password]) }, status: :created
          else
            render json: { errors: company.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # 🔑 Login and get JWT Token 
        def login
          company = Company.find_by(email: params[:email])
          if company&.valid_password?(params[:password])
            token = JsonWebToken.encode(company_id: company.id.to_s)
            render json: { token: token, company: company.as_json(except: [:encrypted_password]) }, status: :ok
          else
            render json: { error: "Invalid email or password" }, status: :unauthorized
          end
        end
  
        # 👤 Get Logged-in Company Info
        def profile
          render json: { company: @current_company.as_json(except: [:encrypted_password]) }, status: :ok
        end
  
        private
  
        def company_params
          params.require(:company).permit(:email, :password, :name, :contact_person, :phone_number, :website)
        end
      end
    end
  end
  