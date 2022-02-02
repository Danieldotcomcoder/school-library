require_relative '../student'

describe Student do
    context "Testing the Student Class"
    newstudent = Student.new(id: 152,age: 33, name: 'danny', parent_permission: true, classroom: 'Grade 10')
    it 'Add Person' do
        expect(newstudent.id).to eq 152
        expect(newstudent.age).to eq 33
        expect(newstudent.name).to eq 'danny'
        expect(newstudent.parent_permission).to eq true
        expect(newstudent.classroom).to eq 'Grade 10'
    end

    it ' test play hooky method' do
        expect(newstudent.play_hooky).to eq "¯\(ツ)/¯"
    end
end