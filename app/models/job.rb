class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :location, type: String
  field :timeStatus, type: String
  field :salary, type: String
  field :description, type: String

  belongs_to :company
end
