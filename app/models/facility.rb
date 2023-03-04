class Facility < ApplicationRecord
	validates :name, :membercost, :guestcost, :initialoutlay, :monthlymaintenance, presence: true

	scope :all_facilities, -> {all}
	scope :names_and_costs, -> {pluck(:name, :membercost)}
	scope :fee_to_members, -> {where('membercost > 0')}
	scope :membercost_less_than_monthlymaintenancecost, -> {where('membercost > 0 and membercost < monthlymaintenance/50.0').pluck(:name, :membercost, :monthlymaintenance)}
	scope :tennis, -> {where('name LIKE ?', '%Tennis%')}
	scope :specific_ids, -> (ids) {find(ids)}
end