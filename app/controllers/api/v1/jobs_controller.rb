class Api::V1::JobsController < ApplicationController
    before_action :set_job, only: [:show]
  
    def index
      jobs = Job.all
      render json: jobs.map { |job| format_job(job) }
    end
  
    def show
      render json: format_job(@job)
    end
  
    private
  
    def set_job
      @job = Job.find(params[:id])
    end
  
    def format_job(job)
      {
        id: job.id.to_s,
        title: job.title,
        company: job.company.name,
        company_id: job.company.id.to_s,
        location: job.location,
        type: job.timeStatus,
        salary: job.salary,
        description: job.description,
        posted_on: job.created_at.strftime('%B %d, %Y') # Converts created_at to "February 27, 2025"
      }
    end
  end
  