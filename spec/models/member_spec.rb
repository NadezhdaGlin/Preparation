require 'rails_helper'

RSpec.describe Member, type: :model do
  let!(:member) {create :member}
  let!(:member2) {create :member, 
        surname: "Smith", 
        firstname: "Williams", 
        address: "103 Firth Avenue, North Reading", 
        zipcode: "7832", 
        telephone: "678 324 2134", 
        joindate: "2012-02-15"}

  let!(:member3) {create :member, 
        surname: "Jane", 
        firstname: "Black", 
        address: "33 Cheerful Plaza, Drake Road, Westford", 
        zipcode: "0239", 
        telephone: "(811) 832 0231", 
        joindate: "2021-11-08"}

  context '9 task' do
    let(:params) {2}
    subject(:limit_surname) {described_class.limit_surname(params)}
    it 'return limited surname' do
      expect(limit_surname).to contain_exactly(member.surname, member3.surname)
    end
  end
end
