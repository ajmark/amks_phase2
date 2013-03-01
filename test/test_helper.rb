ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all
  def deny(condition)
  # a simple transformation to increase readability IMO
  	assert !condition
  end

  def create_event
  	@breaking = FactoryGirl.create(:event)
  	@sparring = FactoryGirl.create(:event, :name => "Sparring")
  	@forms = FactoryGirl.create(:event, :name => "Forms", :active => false)
  end 

  def remove_event
    @breaking.destroy
    @sparring.destroy
    @forms.destroy
  end

  def create_student
  	@alex = FactoryGirl.create(:student)
  	@chris = FactoryGirl.create(:student, :first_name => "Chris", :date_of_birth => 17.years.ago, :rank => 3, :phone => 1234567890)
  	@steph = FactoryGirl.create(:student, :first_name => "Steph", :date_of_birth => 15.years.ago, :rank => 1, :waiver_signed => false)
  end   

  def remove_student
  	@alex.destroy
  	@chris.destroy
  	@steph.destroy
  end 
end
