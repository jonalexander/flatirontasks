require 'rails_helper'

RSpec.describe Assignment, :type => :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}

  describe "complete" do
    it 'has an assignment status attribute that defaults to false' do
      bangarangs = Cohort.create(name: 'bangarangs')
      clark = Student.create(name: 'clark', email: 'clark@flatiron-school.com', password: '12345', cohort_id: bangarangs.id)
      rails = Assignment.create(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
      sa = StudentAssignment.create(status: false, student_id: clark, assignment_id: rails)
      result = rails.statuses(bangarangs)[0][1]
      expect(result).to eql(false)
    end
  end

end
