class Admin::DashboardController < ApplicationController
    before_action :authenticate_company! # Devise method to check if user is logged in
    layout "admin"  # Specify the layout here
    
    def index
      @company = current_company
      @jobs = @company.jobs || []  # Ensure it's an empty array if nil
      @applications = @company.applications || []  # Ensure it's an empty array if nil
      @recent_activity = @company.jobs.order(created_at: :desc).limit(5) || []  # Ensure it's an empty array if nil
    end
  end
  