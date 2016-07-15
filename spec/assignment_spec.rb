require 'rails_helper'

RSpec.describe StudentAssignment, :type => :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}

  describe "complete" do
    it 'has an assignment status attribute that defaults to false' do
      expect(self.status).to eq(false)
    end
  end

end
