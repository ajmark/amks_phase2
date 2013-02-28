class Section < ActiveRecord::Base
  attr_accessible :active, :event_id, :max_age, :max_rank, :min_age, :min_rank
  #Relationships
  belongs_to :event 
  belongs_to_many :registrations
  #Validations
  validates_numericality_of :event_id, :on => :create 	

  #Scopes
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('name')
  scope :for_event, 
  scope :for_rank,
  scope :for_age, 
end
