class Student < ActiveRecord::Base
  attr_accessible :active, :date_of_birth, :first_name, :id, :last_name, :phone, :rank, :waiver_signed
  #Relationships
  has_many :registrations
  has_many :sections, :through => :registrations
  #Validations
  validates_prescemce_of :id 
  validates_prescemce_of :first_name
  validates_prescemce_of :last_name
  validates_prescemce_of :date_of_birth
  validates_prescemce_of :rank
  validates_date :date_of_birth
  validates_numericality_of :phone
  #Scopes
  scope :juniors, where('date_of_birth >= ?', 18.years.ago)
  scope :seniors, where('date_of_birth <= ?', 18.years.ago)
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('name')
  scope :has_waiver, where('waiver_signed = ?', true)
  scope :needs_waiver, where('waiver_signed = ?', false)
  scope :by_rank, order_by('rank DESC')
  #Methods
  def name
  	 last_name + ", " + first_name
  end 

  def proper_name
	first_name.capitalize + " " + last_name.capitalize
  end 

  def over_18?(student)
  	if student.date_of_birth >= 18.years.ago
  		return false 
  	else 
  		return true 
  	end
  end 

  def age
  end 

  def registered_for_section
  end 


end
