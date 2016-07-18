require_relative 'rails_helper.rb'

RSpec.describe Cohort, type: :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student: student, assignment: assignment, status: false)}

  describe "create cohort", type: :feature do
    it 'knows about all of its students' do
      pets = Cohort.create!(name:'pets')
      jon = Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: pets)
      pets.students << jon
      expect(pets.students).to include(jon)
    end
  end 
   
  describe "ranked_students", type: :feature do
    it "can rank the students based off of completed assignments for a cohort" do
   #   teacher = Instructor.create(name: "Jeff")
      pets = Cohort.create!(name:'pets')
      
      clark = Student.create!(name: 'Clark', email: 'clark@flatiron-school.com', password: '12346', cohort_id: pets.id)
      rose = Student.create!(name: 'Rose', email: 'rose@flatiron-school.com', password: '12346', cohort_id: pets.id)
      
      rails = Assignment.create!(name: 'Rails Lab', description: 'A Rails Project', time: 3, priority: 2)
      javascript = Assignment.create!(name: 'JavaScript Lab', description: 'Write a site in JavaScript', time: 3, priority: 2)
      
      jeff = Instructor.new(name: "Jeff")

      CohortAssignment.create(cohort: pets, assignment: rails, instructor: jeff)
      CohortAssignment.create(cohort: pets, assignment: javascript, instructor: jeff)
      
      StudentAssignment.create!(student: clark, assignment: rails, status: false)
      StudentAssignment.create!(student: clark, assignment: javascript, status: true)
      StudentAssignment.create!(student: rose, assignment: rails, status: true)
      StudentAssignment.create!(student: rose, assignment: javascript, status: true)
      
      result = [["Clark", {:complete=>1, :incomplete=>1}], ["Rose", {:complete=>2, :incomplete=>0}]]
      expect(pets.ranked_students).to eql(result)
    end
  end 

end
