require 'rails_helper'

RSpec.describe Assignment, :type => :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}

  it 'has an assignment status attribute that defaults to false' do
    result = assignment.statuses(cohort)[0][1]
    expect(result).to eql(false)
  end

end
