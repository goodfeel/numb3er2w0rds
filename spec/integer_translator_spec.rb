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

  describe 'CONSTANTS' do
    it 'should return correct constants' do
      expect(IntegerTranslator::THOUSANDS.first).to eq('thousand')
      expect(IntegerTranslator::THOUSANDS[2]).to eq('billion')
      expect(IntegerTranslator::THOUSANDS.last).to eq('quadrillion')

      expect(IntegerTranslator::NUMBERS.first).to eq('')
      expect(IntegerTranslator::NUMBERS[6]).to eq('six')
      expect(IntegerTranslator::NUMBERS.last).to eq('nineteen')

      expect(IntegerTranslator::TENS.first).to eq('')
      expect(IntegerTranslator::TENS[6]).to eq('sixty')
      expect(IntegerTranslator::TENS.last).to eq('ninety')
    end
  end

  describe '#translate' do
    context 'zero' do
      it 'should return string zero' do
        translator = IntegerTranslator.new(0)
        expect(translator.translate).to eq('zero')
      end
    end

    context 'negative' do
      it 'should return prefix negative' do
        translator = IntegerTranslator.new(-1)
        expect(translator.translate).to eq('Negative ')
      end
    end
  end


end
