require 'rails_helper'

RSpec.describe Instructor, :type => :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'Jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student_id: 1, assignment_id: 1, status: false)}

  it "has cohorts" do
      jeff = Instructor.create(name: 'jeff', email: 'jeff@flatiron-school.com', password: '666666')
      pets = Cohort.create(name:'pets')
      instructor_cohort = InstructorCohort.create(instructor_id: jeff.id, cohort_id: pets.id)
      expect(jeff.cohorts.first).to eq(pets)
  end

  it 'can assign assignments to cohort' do
    jeff = Instructor.create(name: 'jeff', email: 'jeff@flatiron-school.com', password: '666666')
    pets = Cohort.create(name:'pets')
    rails = Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
    jeff.add_assignment_to_cohort(pets, rails)
    expect(pets.assignments).to include(rails)
  end

  it 'can see students who have finished the assignments' do
    jeff = Instructor.create(name: 'jeff', email: 'jeff@flatiron-school.com', password: '666666')
    pets = Cohort.create(name:'pets')
    rails = Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
    expect(rendered).to
  end

end
