require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:cohort) {Cohort.create!(name:'pets')}
  let(:student) {Student.create!(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}
  let(:assignment) {Assignment.create!(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)}
  let(:student_assignment) {StudentAssignment.create!(student: student, assignment: assignment, status: false)}

  describe "show page", type: :feature do
    it "has a dashboard" do
      clark = Student.create!(name: 'Clark', email: 'clark@flatiron-school.com', password: '12346', cohort_id: 1)
      visit student_path(clark)
      expect(page.status_code).to eq(200)
    end
  end

    it "can mark assignment as complete" do
      expect(student.assignment_status(assignment)).to eq(true)
    end

end
