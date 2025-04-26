class Application
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :phone_number, type: String
  field :cover_letter, type: String

  belongs_to :job
  belongs_to :company
end
