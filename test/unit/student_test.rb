require 'test_helper'

class StudentTest < ActiveSupport::TestCase
	#Relionship Macros
	should_have_many(:registrations)
	#Validation Macros
	should_validate_presence_of(:first_name)  
	should_validate_presence_of(:last_name)  
	should_validate_presence_of(:date_of_birth) 
	should_validate_presence_of(:rank)   

	context "Creating three students" do 
  		setup do 
			create_event
		end 

		teardown do
			remove_event
		end 

    	should "have name methods that list last_name, first_name combined" do
      		assert_equal "Mark, Alex", @alex.name
      		assert_equal "Mark, Chris", @chris.name
      		assert_equal "Mark, Steph", @steph.name
    	end

    	should "have scope to alphabetize order "

  	end 

end
