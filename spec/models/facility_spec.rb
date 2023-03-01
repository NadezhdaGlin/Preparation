require 'rails_helper'

RSpec.describe Facility, type: :model do
  let!(:facility1){Facility.create!(name: "Badminton", membercost: 5.7, guestcost: 10, initialoutlay: 1500, monthlymaintenance: 20)}
  let!(:facility2){Facility.create!(name: "Pool Table", membercost: 2, guestcost: 0, initialoutlay: 600, monthlymaintenance: 5)}

  it 'return all facilities' do
    facilities = Facility.all_facilities
    expect(facilities).to contain_exactly(facility1, facility2)
  end

  it 'return names and costs' do
    facility_name_cost = Facility.names_and_costs
    expect(facility_name_cost).to contain_exactly([facility1.name, facility1.membercost],[facility2.name, facility2.membercost])
  end
end
