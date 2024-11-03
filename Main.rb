require_relative 'Person'




st = StudentPerson.new("Vova","Dobry","2005-07-08")
vt = StudentPerson.new("Vova","Dobry","2024-07-09")
bt = StudentPerson.new("Vova","Dobry","2024-07-08")


# students_by_age = StudentPerson.get_student_by_age(19)
# puts students_by_age
# StudentPerson.remove_student(st)
# puts StudentPerson.students
puts StudentPerson.get_student_by_name("Vov")