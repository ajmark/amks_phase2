require 'test_helper'

class EventTest < ActiveSupport::TestCase
	#Relationship Macros
	should have_many(:sections)
	#Validation Macros
	should validate_presence_of(:name)

	context "Creating three events" do 
		setup do 
			create_event
		end 

		teardown do
			remove_event
		end 

		should "have a scope to alphabetize events" do 
			assert_equal ["Breaking","Forms","Sparring"], Event.alphabetical.map{|t| t.name}
		end  

		should "have a scope to select active tasks only" do 
			assert_equal ["Breaking","Sparring"], Event.active.alphabetical.map{|t| t.name}
		end 

		should "have a scope to select inactive tasks only" do 
			assert_equal ["Forms"], Event.inactive.alphabetical.map{|t| t.name}
		end 
	end 

end
