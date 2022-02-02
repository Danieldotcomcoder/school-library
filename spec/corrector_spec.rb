require_relative '../corrector'

describe Corrector do
    context ' Test the Corrector Class'
    corrector = Corrector.new()
    it 'should return the first letter capitalized' do
        expect(corrector.correct_name('dani')).to eq 'Dani'
    end
end
