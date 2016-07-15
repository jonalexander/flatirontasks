require 'rails_helper'

RSpec.describe Task, :type => :model do
  # let(:student) {Student.create!(id: 1, name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: 1)}

  describe "task status" do
    it 'has a task status attribute that defaults to false' do
      bangarangs = Cohort.create(name: 'bangarangs')
      clark = Student.create(name: 'clark', email: 'clark@flatiron-school.com', password: '12345', cohort_id: bangarangs.id)
      blog = Task.create(name: 'Research my blog post', description: 'Some ideas for my blog post..........', time: 2, status: false, student_id: clark.id, priority: 5)
      expect(blog.status).to eql(false)
    end
  end

end
