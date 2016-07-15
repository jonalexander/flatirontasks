require_relative 'rails_helper.rb'

RSpec.describe StudentAssignment, :type => :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student_id: 1, assignment_id: 1, status: false)}

  describe "#name" do
    it 'assigns assignment to student' do
      byebug
      # expect(student.name).to eq('jon')
      # expect(assignment.students.first.name).to eq('jon')
      expect(student.assignments[0].name).to eq('Rails Lab')
    end
  end
end
