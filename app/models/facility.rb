class Facility < ApplicationRecord
	validates :name, :membercost, :guestcost, :initialoutlay, :monthlymaintenance, presence: true

	scope :all_facilities, -> {all}
end
