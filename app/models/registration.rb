class Registration < ActiveRecord::Base
  attr_accessible :date, :fee_paid, :final_standing, :section_id, :student_id
  #Relationships
  belongs_to :student
  belongs_to :section
  #Validations
  validates_presence_of :section_id
  validates_presence_of :student_id
  validates_presence_of :id 
  #Scopes
end
