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
			create_student
		end 

		teardown do
			remove_student
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

    should "have method that determines if a student is 18 or older" do
      assert_equal true, @alex.over_18?
      assert_equal false, @chris.over_18?
      assert_equal false, @steph.over_18?
    end 

    should "have method that returns student's age" do 
      assert_equal 20, @alex.age
      assert_equal 17, @chris.age
      assert_equal 15, @steph.age
    end 

  	should "have scope to alphabetize order by name" do 
      assert_equal ["Mark, Alex", "Mark, Chris", "Mark, Steph"], Student.alphabetical.map{|c| c.name}
   	end 

    should "have scope to return all junior students" do
      assert_equal ["Chris Mark","Steph Mark"], Student.juniors.alphabetical.map{|c| c.proper_name}
  	end 

    should "have scope to return all senior students" do
      assert_equal ["Alex Mark"], Student.seniors.alphabetical.map{|c| c.proper_name}
    end 

    should "have scope to return students who need to submit a waiver" do
      assert_equal ["Mark, Steph"], Student.needs_waiver.alphabetical.map{|s| s.name}
    end 

    should "have scope to return students who have waivers on file" do
      assert_equal ["Mark, Alex", "Mark, Chris"], Student.has_waiver.alphabetical.map{|s|s.name}
    end 

    should "have scope to return students ordered by rank" do
      assert_equal ["Alex Mark", "Chris Mark", "Steph Mark"], Student.by_rank.alphabetical.map { |s|s.proper_name  }
    end 

    should "have scope to return students between given ranks (inclusive)" do 
      assert_equal ["Chris Mark", "Steph Mark"], Student.ranks_between(1, 10).alphabetical.map {|s| s.proper_name}
    end 

    should "have scope to return students between given age(inclusive)" do
      assert_equal ["Mark, Chris", "Mark, Steph"], Student.ages_between(10, 18).alphabetical.map {|s| s.name}
    end 

    should "have scope to return all gups" do 
      assert_equal ["Chris Mark", "Steph Mark"], Student.gups.alphabetical.map { |s| s.proper_name }
    end 

    should "have scope to return all dans" do 
      assert_equal ["Alex Mark"], Student.dans.alphabetical.map {|s| s.proper_name}
    end 

  end 
end
