jon = Student.create(name: 'jon', email: 'jon@flatiron-school.com', password: '12345')
clark = Student.create(name: 'clark', email: 'clark@flatiron-school.com', password: '12345')
jon = Student.create(name: 'laurie', email: 'laurie@flatiron-school.com', password: '12345')


jeff = Instructor.create(name: 'jeff', email: 'jeff@flatiron-school.com', password: '666666')
sam = Instructor.create(name: 'sam', email: 'sam@flatiron-school.com', password: '123123')
leigh = Insturctor.create(name: 'leigh', email: 'leigh@flatiron-school.com', password: '667788')
avi = Instructor.create(name: 'avi', email: 'avi@flatiron-school.com', password: '888888')
steven = Instructor.create(name: 'steven', email: 'steve@flatiron-school.com', password: '454545')


pets = Cohort.create(name:'pets')
bangarangs = Cohort.create(name: 'bangarangs')
ios = Cohort.create(name: 'iOS')


rails_lab = Assignment.create(name: 'Rails Lab', time: 3)
sinatra_lab = Assignment.create(name: 'Sinatra Lab', time: 2)
mvc_lab = Assignment.create(name: 'MVC Lab', time: 5)
group_rails_project = Assignment.create(name: 'Group Project - Rails', time: 6)
group_js_project = Assignment.create(name: 'Group Project - JS', time: 3)


research_blog = Task.create(name: 'Research my blog post', description: 'Some ideas for my blog post..........', time: 2)
side_project = Task.create(name: 'Finish side project', description: 'List of incomplete tasks.....', time: 1)
lunch = Task.create(name: 'Lunch', description: 'Meet friend for lunch', time: 1)

