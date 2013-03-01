FactoryGirl.define do 
	#factory blueprint for event 
	factory :event do 
		name "Breaking"
		active true 
	end 
	#factory blueprint for student
	factory :student do 
		first_name "Alex"
		last_name "Mark"
		date_of_birth 20.years.ago
		rank 20
		phone "6507592924"
		waiver_signed true 
	end 
	#factory blueprint for section
	factory :section do 
	end 
	#factory blueprint for registration
	factory :registration do 
	end 
end 