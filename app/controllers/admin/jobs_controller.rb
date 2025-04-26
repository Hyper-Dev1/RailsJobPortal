module Admin
    class JobsController < ApplicationController
      before_action :authenticate_company!
      before_action :set_job, only: %i[edit update destroy]
      layout "admin"
  
      def index
        @jobs = current_company.jobs  # Show only jobs of the signed-in company
      end
  
      def new
        @job = current_company.jobs.build
      end
  
      def create
        @job = current_company.jobs.build(job_params)
        if @job.save
          redirect_to admin_jobs_path, notice: 'Job created successfully!'
        else
          render :new
        end
      end
  
      def edit
        authorize_job_owner!
      end
  
      def update
        authorize_job_owner!
        if @job.update(job_params)
          redirect_to admin_jobs_path, notice: 'Job updated successfully!'
        else
          render :edit
        end
      end
  
      def destroy
        authorize_job_owner!
        @job.destroy
        redirect_to admin_jobs_url, notice: 'Job was successfully deleted.'
      end
  
      private
  
      def set_job
        @job = Job.find(params[:id])
      end
  
      def authorize_job_owner!
        redirect_to admin_jobs_path, alert: "Unauthorized action!" unless @job.company == current_company
      end
  
      def job_params
        params.require(:job).permit(:title, :description, :location, :salary, :timeStatus).merge(company: current_company)
      end
    end
  end
  