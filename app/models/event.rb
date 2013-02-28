class Event < ActiveRecord::Base
  attr_accessible :active, :name
  #Relationships
  has_many :sections
  #Validations
  validates_presence_of :name
  validates_uniqueness_of :name
  #Scopes
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('name')
end
