class Section < ActiveRecord::Base
  attr_accessible :active, :event_id, :id, :location, :max_age, :min_age, :round_time, :tournament_id
  #Relationships
  belongs_to :event 
  belongs_to_many :registrations
  #Validations
  validates_prescence_of :id 
  validates_numericality_of :event_id, :on => :create 	

  #Scopes
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('name')
  scope :for_event, 
  scope :for_rank,
  scope :for_age, 
end
