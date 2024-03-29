class Student < ActiveRecord::Base
  attr_accessible :active, :date_of_birth, :first_name, :last_name, :phone, :rank, :waiver_signed
  #Relationships
  has_many :registrations
  has_many :sections, :through => :registrations
  #Validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  validates_presence_of :rank
  validates_date :date_of_birth
  validates_numericality_of :phone
  #Scopes
  scope :juniors, where('date_of_birth >= ?', 18.years.ago)
  scope :seniors, where('date_of_birth <= ?', 18.years.ago)
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('first_name')
  scope :has_waiver, where('waiver_signed = ?', true)
  scope :needs_waiver, where('waiver_signed = ?', false)
  scope :by_rank, order('rank DESC')
  scope :gups, where('rank <= ?', 10)
  scope :dans, where('rank >= ?', 11) 
  scope :ranks_between, lambda { |r1, r2| where('rank >= ? and rank <= ?', r1, r2) }
  scope :ages_between, lambda {|a1, a2| where('date_of_birth >= ? and date_of_birth <= ?', a1, a2)} 
  
  #Methods
  def name
  	 last_name + ", " + first_name
  end 

  def proper_name
	first_name.capitalize + " " + last_name.capitalize
  end 

  def over_18?
  	if date_of_birth <= 18.years.ago
  		return true 
  	else 
  		return false 
  	end
  end 

  def age
    Date.today.year - date_of_birth.year
  end 

  def registered_for_section

  end 


end
