module Admin
    class ApplicationsController < ApplicationController
      before_action :authenticate_company!
      before_action :set_application, only: %i[show edit update destroy]
      before_action :authorize_application_owner!, only: %i[show edit update destroy]
      layout "admin"
  
      def index
        @applications = Application.in(job_id: current_company.jobs.pluck(:id))
      end
  
      def show; end
  
      def new
        @application = Application.new
      end
  
      def create
        @application = Application.new(application_params)
        if @application.save
          redirect_to admin_applications_path, notice: 'Application created successfully!'
        else
          render :new
        end
      end
  
      def edit; end
  
      def update
        if @application.update(application_params)
          redirect_to admin_applications_path, notice: 'Application updated successfully!'
        else
          render :edit
        end
      end
  
      def destroy
        @application.destroy
        redirect_to admin_applications_path, notice: 'Application deleted successfully!'
      end
  
      private
  
      def set_application
        @application = Application.find(params[:id])
      end
  
      def authorize_application_owner!
        unless current_company.jobs.include?(@application.job)
          redirect_to admin_applications_path, alert: "Unauthorized action!"
        end
      end
  
      def application_params
        params.require(:application).permit(:status, :job_id).tap do |ap_params|
          ap_params[:company_id] = current_company.id if current_company.present?
        end
      end
    end
  end
  