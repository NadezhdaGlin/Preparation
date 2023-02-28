class Facility < ApplicationRecord
	validates :name, :membercost, :guestcost, :initialoutlay, :monthlymaintenance, presence: true
end
