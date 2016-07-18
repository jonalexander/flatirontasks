require 'rails_helper'

RSpec.describe CommentSorter, :type => :model do 

  describe 'can sort by most comments' do 
    it 'sorts the class instances by number of comments' do 
      assignment1 = Assignment.create(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)

      student1 = Student.create(name: 'clark', email: 'clark@flatiron-school.com', password: '12345', cohort_id: 1)
      student2 = Student.create(name: 'jon', email: 'jon@flatiron-school.com', password: '12366', cohort_id: 2)

      comment1 = Comment.create(commenter: 'clark', body: '...', assignment_id: '1', student_id: student1.id)
      comment2 = Comment.create(commenter: 'clark', body: '...', assignment_id: '1', student_id: student1.id)
      comment3 = Comment.create(commenter: 'clark', body: '...', assignment_id: '1', student_id: student1.id)

      comment4 = Comment.create(commenter: 'jon', body: '...', assignment_id: '1', student_id: student2.id)
      comment5 = Comment.create(commenter: 'jon', body: '...', assignment_id: '1', student_id: student2.id)

      cs = CommentSorter.new
      result = cs.sort_by_most_comments(Student.all)

      expect(result).to eql([student1, student2])
    end
  end

end 
