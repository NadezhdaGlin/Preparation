require 'rails_helper'

RSpec.describe Facility, type: :model do
 
  context '1 task' do
    let!(:facility1) { create :facility }
    let!(:facility2) { create :facility, name: "Pool Table", membercost: 0, guestcost: 3, initialoutlay: 100, monthlymaintenance: 9}
    let!(:facility3) { create :facility, name: 'Table', membercost: 30, guestcost: 5, initialoutlay: 320, monthlymaintenance: 10}

    it 'return all facilities' do
      facilities = Facility.all_facilities
      expect(facilities).to contain_exactly(facility1, facility2, facility3)
    end
  end

  context '2 task' do
    let!(:facility1) { create :facility }
    let!(:facility2) { create :facility, name: "Pool Table", membercost: 0, guestcost: 3, initialoutlay: 100, monthlymaintenance: 9}
    
    it 'return names and costs' do
      facility_name_cost = Facility.names_and_costs
      expect(facility_name_cost).to contain_exactly([facility1.name, facility1.membercost],[facility2.name, facility2.membercost])
    end
  end

  context '3-4 task' do
    let!(:facility1) { create :facility, name: "Massage Room 1", membercost: 35, guestcost: 80, initialoutlay: 4000, monthlymaintenance: 3000}
    let!(:facility2) { create :facility }
    let!(:facility3) { create :facility, name: 'Massage Room 2', membercost: 35, guestcost: 80, initialoutlay: 4000, monthlymaintenance: 3000}
    let!(:facility5) { create :facility, name: 'Pool Table', membercost: 0, guestcost: 5, initialoutlay: 400, monthlymaintenance: 15}

    it 'return all facilities when membercost > 0' do
      membercost = Facility.fee_to_members
      expect(membercost).to contain_exactly(facility1, facility2, facility3)
    end
   
    it 'return membercost less than monthlymaintenancecost' do
      monthlymaintenance = Facility.membercost_less_than_monthlymaintenancecost
      expect(monthlymaintenance).to contain_exactly([facility1.name, facility1.membercost, facility1.monthlymaintenance],[facility3.name, facility3.membercost, facility3.monthlymaintenance])
    end
  end

  context '5-6 task' do
    let!(:facility1) { create :facility, name: "Tennis Court 1", membercost: 5, guestcost: 25, initialoutlay: 10000, monthlymaintenance: 200}
    let!(:facility2) { create :facility }
    let!(:facility3) { create :facility, name: 'Table Tennis', membercost: 0, guestcost: 5, initialoutlay: 302, monthlymaintenance: 10}
    let!(:facility4) { create :facility, name: 'Snooker Table', membercost: 0, guestcost: 5, initialoutlay: 450, monthlymaintenance: 15}
    
    it 'return all facilities with the word Tennis in name' do
      name = Facility.tennis
      expect(name).to contain_exactly(facility1, facility3)
    end

    let(:params) {[facility1.id, facility2.id]}
    subject(:specific_ids) {described_class.specific_ids(params)}

    it 'return specific ids' do
      expect(specific_ids).to contain_exactly(facility1, facility2)
    end
  end

end
