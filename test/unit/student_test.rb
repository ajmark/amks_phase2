require 'test_helper'

class StudentTest < ActiveSupport::TestCase
	#Relionship Macros
	should have_many(:registrations)
	#Validation Macros
	should validate_presence_of(:first_name)  
	should validate_presence_of(:last_name)  
	should validate_presence_of(:date_of_birth) 
	should validate_presence_of(:rank)   

	context "Creating three students" do 
  		setup do 
			create_event
		end 

		teardown do
			remove_event
		end 

    	should "have name method that lists last_name, first_name combined" do
      		assert_equal "Mark, Alex", @alex.name
      		assert_equal "Mark, Chris", @chris.name
      		assert_equal "Mark, Steph", @steph.name
    	end

    	should "have method that lists first_name last_name" do
    		assert_equal "Alex Mark", @alex.proper_name
    		assert_equal "Chris Mark", @chris.proper_name
    		assert_equal "Steph Mark", @steph.proper_name
    	end 

    	should "have scope to alphabetize order " do 
    	end 

  	end 

end
