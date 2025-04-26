module Api
  module V1
    class ApplicationsController < ApplicationController
      def create
        # Find the company by ID from the request payload
        company = Company.find(params[:company_id])
        
        # Build the application, associating it with the company and the job
        @application = company.applications.build(application_params)
    
        # Save the application
        if @application.save
          render json: { message: 'Application submitted successfully' }, status: :created
        else
          render json: { errors: @application.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def application_params
        params.require(:application).permit(:name, :email, :phone_number, :cover_letter, :job_id)
      end
    end
  end
end
