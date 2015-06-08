require './integer_translator'

RSpec.describe IntegerTranslator do
  describe '#initialize' do
    context 'with incorrect input' do
      it 'should initialize input value' do
        expect { IntegerTranslator.new(20.430) }.to raise_error
      end
    end

    context 'with correct input' do
      it 'should initialize input value' do
        translator = IntegerTranslator.new(20)
        expect(translator.input).to eq(20)
      end
    end
  end

  
end
