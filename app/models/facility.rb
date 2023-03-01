class Facility < ApplicationRecord
	validates :name, :membercost, :guestcost, :initialoutlay, :monthlymaintenance, presence: true

	scope :all_facilities, -> {all}
	scope :names_and_costs, -> {pluck(:name, :membercost)}
end
