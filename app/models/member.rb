class Member < ApplicationRecord
	validates :surname, :firstname, :address, :zipcode, :telephone, :joindate, presence: true
	validates :telephone, format: { with: /(^\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$)/ }

	# scope :joined_after_thestart_september_2012, -> {where('joindate >= 01 Sep 2012').pluck(:surname, :firstname, :joindate)}
	scope :limit_surname, -> (limit) {order(:surname).limit(limit).distinct.pluck(:surname)}
end
