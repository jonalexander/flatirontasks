require 'rails_helper'

RSpec.describe Instructor, :type => :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:instructor) {Instructor.create!(name: 'jeff', email: 'jeff@flatiron-school.com', password: '666666')}
  let(:student) {Student.create!(name: 'Jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student_id: 1, assignment_id: 1, status: false)}
  let(:instructor_cohort) {InstructorCohort.create!(instructor_id: instructor, cohort_id: cohort)}

  it "has cohorts" do
    instructor.cohorts << cohort
    expect(instructor.cohorts).to include(cohort)
  end

  it 'can assign assignments to cohort' do
    instructor.add_assignment_to_cohort(cohort, assignment)
    expect(cohort.assignments).to include(assignment)
  end

end
