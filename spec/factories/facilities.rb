FactoryBot.define do
	factory :facility do
		name { 'Badminton' }
		membercost { 5.7 }
		guestcost { 10 }
		initialoutlay { 1500 }
		monthlymaintenance { 20 }
	end
end