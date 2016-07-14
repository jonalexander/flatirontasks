
Cohort.destroy_all
Student.destroy_all
Instructor.destroy_all
Assignment.destroy_all
Task.destroy_all
StudentAssignment.destroy_all
InstructorCohort.destroy_all

@pets = Cohort.create(name:'pets')
@bangarangs = Cohort.create(name: 'bangarangs')
@ios = Cohort.create(name: 'iOS')

@jon = Student.create(name: 'jon', email: 'jon@flatiron-school.com', password: '12345', cohort_id: @pets.id)
@clark = Student.create(name: 'clark', email: 'clark@flatiron-school.com', password: '12345', cohort_id: @bangarangs.id)
@laurie = Student.create(name: 'laurie', email: 'laurie@flatiron-school.com', password: '12345', cohort_id: @ios.id)

@jeff = Instructor.create(name: 'jeff', email: 'jeff@flatiron-school.com', password: '666666')
@sam = Instructor.create(name: 'sam', email: 'sam@flatiron-school.com', password: '123123')
@leigh = Instructor.create(name: 'leigh', email: 'leigh@flatiron-school.com', password: '667788')
@avi = Instructor.create(name: 'avi', email: 'avi@flatiron-school.com', password: '888888')
@steven = Instructor.create(name: 'steven', email: 'steve@flatiron-school.com', password: '454545')

@rails_lab = Assignment.create(name: 'Rails Lab', description: 'jdfjdsfjnsdfjn', time: 3, priority: 2)
@sinatra_lab = Assignment.create(name: 'Sinatra Lab', description: 'jdfjdsfjnsdfjn', time: 2, priority: 4)
@mvc_lab = Assignment.create(name: 'MVC Lab', description: 'jdfjdsfjnsdfjn', time: 5, priority: 5)
@group_rails = Assignment.create(name: 'Group Project - Rails', description: 'jdfjdsfjnsdfjn', time: 6, priority: 6)
@group_js = Assignment.create(name: 'Group Project - JS', description: 'jdfjdsfjnsdfjn', time: 3, priority: 7)

@blog = Task.create(name: 'Research my blog post', description: 'Some ideas for my blog post..........', time: 2, student_id: @jon.id, priority: 5)
@side_project = Task.create(name: 'Finish side project', description: 'List of incomplete tasks.....', time: 1, student_id: @clark.id, priority: 4)
@lunch = Task.create(name: 'Lunch', description: 'Meet friend for lunch', time: 1, student_id: @laurie.id, priority: 3)

@pets.assignments << @rails_lab
@pets.assignments << @sinatra_lab
@pets.assignments << @mvc_lab
@bangarangs.assignments << @group_rails
@ios.assignments << @group_js

# @jon.assignments << @rails_lab
# @clark.assignments << @sinatra_lab
# @laurie.assignments << @mvc_lab
# @jon.assignments << @group_rails
# @clark.assignments << @group_rails
# @laurie.assignments << @group_rails
# @jon.assignments << @group_js
# @clark.assignments << @group_js
# @laurie.assignments << @group_js

@jeff.cohorts << @pets
@steven.cohorts << @bangarangs
@leigh.cohorts << @pets
@sam.cohorts << @pets
@avi.cohorts << @ios

@jon.save
@laurie.save
@clark.save
@jeff.save
@steven.save
@leigh.save
@sam.save
@avi.save
