require 'securerandom'
require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student: student, assignment: assignment, status: false)}

  describe "#assignment_status" do
    it "can find an assignment's status" do
      clark = Student.create!(name: 'Clark', email: 'clark@flatiron-school.com', password: '12346', cohort_id: 1)
      rails = Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
      sa = StudentAssignment.create!(student: clark, assignment: rails, status: false)
      expect(clark.assignment_status(rails)).to eq("Incomplete")
    end
  end

  describe "show page", type: :feature do
    it "has a dashboard" do
      clark = Student.create!(name: 'Clark', email: 'clark@flatiron-school.com', password: '12346', cohort_id: 1)
      visit student_path(clark)
      expect(page.status_code).to eq(200)
    end
  end

  describe "mark complete", type: :model do
    it "can mark assignment as complete" do
      click_link('Change Status')
      expect(student.assignment_status(assignment)).to eq(true)
    end
  end

  it "is valid with valid attributes" do
    jon = Student.create!(name: 'Jon', email: 'jon@flatiron-school.com', password: "12345")
    expect(jon).to be_valid
  end
   it "is not valid without a name"
   it "is not valid without an email"
   it "is not valid without a password"
end
