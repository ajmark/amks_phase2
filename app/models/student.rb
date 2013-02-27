class Student < ActiveRecord::Base
  attr_accessible :active, :date, :id, :max_rank, :min_rank, :name
  #Relationships
  has_many :registrations
  has_many :sections, :through => :registrations
  #Validations
  validates_prescemce_of :id 
  #Scopes
end
