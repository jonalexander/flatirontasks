require_relative 'rails_helper.rb'

RSpec.describe Cohort, type: :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student: student, assignment: assignment, status: false)}

  it 'knows about all of its students' do
    pets = Cohort.create!(name:'pets')
    jon = Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: pets)
    pets.students << jon
    expect(pets.students).to include(jon)
  end

end
