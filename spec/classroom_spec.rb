require_relative '../classroom'
require_relative '../student'

describe Classroom do
    context "Testing the Classroom Class"
    newclass = Classroom.new('new Class')
    it 'check classroom' do
        expect(newclass.label).to eq 'new Class'
    end

    it 'Add student to class' do
        newstudent = Student.new(id: 152,age: 33, name: 'danny', parent_permission: true, classroom: 'Grade 10')
        newstudent2 = Student.new(id: 522,age: 23, name: 'sam', parent_permission: true, classroom: 'Grade 10')

        newclass.add_student(newstudent)
        newclass.add_student(newstudent2)
        expect(newclass.students.length).to eq 2
    end

end