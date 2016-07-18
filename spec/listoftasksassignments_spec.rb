require 'rails_helper'

RSpec.describe ListOfTasksAssignments, :type => :model do
  
  describe '#tasks_and_assignments' do 
    it 'provides unordered list of students tasks and assignments' do 
      cohort = Cohort.new(name: 'pets_database', )

      jon = Student.create(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: cohort.id)
      assignment1 = Assignment.create(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
      assignment2 = Assignment.create(name: 'MVC Lab', description: 'jdfjdsfjnsdfjn', time: 5, priority: 5)
      jon.assignments << assignment1
      jon.assignments << assignment2
      cohort.assignments << assignment1
      cohort.assignments << assignment2
      task1 = Task.create(name: 'homework', description: 'finish part 1', student_id: jon.id)
      lota = ListOfTasksAssignments.new(jon)

      expect(lota.student).to eql(jon)
      expect(lota.tasks_and_assignments.count).to eql(3)
      expect(lota.tasks_and_assignments).to eql([assignment1, assignment2, task1])
    end
  end

  describe '#sort_list' do 
    it 'sorts list of tasks and assignments by priority desc' do 
      cohort = Cohort.new(name: 'pets_database', )

      jon = Student.create(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: cohort.id)
      assignment1 = Assignment.create(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
      assignment2 = Assignment.create(name: 'MVC Lab', description: 'jdfjdsfjnsdfjn', time: 5, priority: 5)
      task1 = Task.create(name: 'homework', description: 'finish part 1', time: 1, priority: 1, student_id: jon.id)
      jon.assignments << assignment1
      jon.assignments << assignment2
      cohort.assignments << assignment1
      cohort.assignments << assignment2
      lota = ListOfTasksAssignments.new(jon)
      params = {:sort => {:sort_id => ['priority'], :order => ['desc']}}
      lota.sort_list(params)

      expect(lota.sorted_list).to eql([assignment2, assignment1, task1])
    end
  end

    describe '#sort_list' do 
    it 'sorts list of tasks and assignments by time desc' do 
      cohort = Cohort.new(name: 'pets_database', )

      jon = Student.create(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: cohort.id)
      assignment1 = Assignment.create(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
      assignment2 = Assignment.create(name: 'MVC Lab', description: 'jdfjdsfjnsdfjn', time: 5, priority: 5)
      task1 = Task.create(name: 'homework', description: 'finish part 1', time: 1, priority: 1, student_id: jon.id)
      jon.assignments << assignment1
      jon.assignments << assignment2
      cohort.assignments << assignment1
      cohort.assignments << assignment2

      lota = ListOfTasksAssignments.new(jon)
      params = {:sort => {:sort_id => ['time'], :order => ['desc']}}
      lota.sort_list(params)
      
      expect(lota.sorted_list).to eql([assignment2, assignment1, task1])
    end
  end
end



