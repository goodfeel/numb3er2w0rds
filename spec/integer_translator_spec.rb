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
        expect(translator.translate).to eq('Negative one')
      end
    end

    context 'single digit' do
      it 'should return correct digits' do
        translator = IntegerTranslator.new(1)
        expect(translator.translate).to eq('one')

        translator = IntegerTranslator.new(2)
        expect(translator.translate).to eq('two')

        translator = IntegerTranslator.new(3)
        expect(translator.translate).to eq('three')

        translator = IntegerTranslator.new(4)
        expect(translator.translate).to eq('four')

        translator = IntegerTranslator.new(5)
        expect(translator.translate).to eq('five')

        translator = IntegerTranslator.new(6)
        expect(translator.translate).to eq('six')

        translator = IntegerTranslator.new(7)
        expect(translator.translate).to eq('seven')

        translator = IntegerTranslator.new(8)
        expect(translator.translate).to eq('eight')

        translator = IntegerTranslator.new(9)
        expect(translator.translate).to eq('nine')
      end
    end # context single digit

    context 'special 11 12 .. 19' do
      it 'should return correct digits' do
        translator = IntegerTranslator.new(10)
        expect(translator.translate).to eq('ten')

        translator = IntegerTranslator.new(11)
        expect(translator.translate).to eq('eleven')

        translator = IntegerTranslator.new(12)
        expect(translator.translate).to eq('twelve')

        translator = IntegerTranslator.new(13)
        expect(translator.translate).to eq('thirteen')

        translator = IntegerTranslator.new(14)
        expect(translator.translate).to eq('fourteen')

        translator = IntegerTranslator.new(15)
        expect(translator.translate).to eq('fifteen')

        translator = IntegerTranslator.new(16)
        expect(translator.translate).to eq('sixteen')

        translator = IntegerTranslator.new(17)
        expect(translator.translate).to eq('seventeen')

        translator = IntegerTranslator.new(18)
        expect(translator.translate).to eq('eighteen')

        translator = IntegerTranslator.new(19)
        expect(translator.translate).to eq('nineteen')

        translator = IntegerTranslator.new(20)
        expect(translator.translate).to eq('twenty')
      end
    end # context special 11 12 .. 19

    context '10 20 30 40 .. 90' do
      it 'should return correct digits' do
        translator = IntegerTranslator.new(10)
        expect(translator.translate).to eq('ten')

        translator = IntegerTranslator.new(20)
        expect(translator.translate).to eq('twenty')

        translator = IntegerTranslator.new(30)
        expect(translator.translate).to eq('thirty')

        translator = IntegerTranslator.new(40)
        expect(translator.translate).to eq('fourty')

        translator = IntegerTranslator.new(50)
        expect(translator.translate).to eq('fifthy')

        translator = IntegerTranslator.new(60)
        expect(translator.translate).to eq('sixty')

        translator = IntegerTranslator.new(70)
        expect(translator.translate).to eq('seventy')

        translator = IntegerTranslator.new(80)
        expect(translator.translate).to eq('eighty')

        translator = IntegerTranslator.new(90)
        expect(translator.translate).to eq('ninety')

      end
    end # 10 20 30 40 .. 90

    context 'sampling in tenth zone' do
      it 'should return correct digits' do
        translator = IntegerTranslator.new(21)
        expect(translator.translate).to eq('twenty one')

        translator = IntegerTranslator.new(32)
        expect(translator.translate).to eq('thirty two')

        translator = IntegerTranslator.new(43)
        expect(translator.translate).to eq('fourty three')

        translator = IntegerTranslator.new(54)
        expect(translator.translate).to eq('fifthy four')

        translator = IntegerTranslator.new(65)
        expect(translator.translate).to eq('sixty five')

        translator = IntegerTranslator.new(76)
        expect(translator.translate).to eq('seventy six')

        translator = IntegerTranslator.new(87)
        expect(translator.translate).to eq('eighty seven')

        translator = IntegerTranslator.new(98)
        expect(translator.translate).to eq('ninety eight')

      end
    end #sampling in tenth zone

    context '100 200 .. 900' do
      it 'should return correct digits' do
        translator = IntegerTranslator.new(100)
        expect(translator.translate).to eq('one hundred')

        translator = IntegerTranslator.new(200)
        expect(translator.translate).to eq('two hundred')

        translator = IntegerTranslator.new(300)
        expect(translator.translate).to eq('three hundred')

        translator = IntegerTranslator.new(400)
        expect(translator.translate).to eq('four hundred')

        translator = IntegerTranslator.new(500)
        expect(translator.translate).to eq('five hundred')

        translator = IntegerTranslator.new(600)
        expect(translator.translate).to eq('six hundred')

        translator = IntegerTranslator.new(700)
        expect(translator.translate).to eq('seven hundred')

        translator = IntegerTranslator.new(800)
        expect(translator.translate).to eq('eight hundred')

        translator = IntegerTranslator.new(900)
        expect(translator.translate).to eq('nine hundred')
      end
    end # 100 200 .. 900


    context 'hunreds sampling' do
      it 'should return correct digits' do
        translator = IntegerTranslator.new(101)
        expect(translator.translate).to eq('one hundred and one')

        translator = IntegerTranslator.new(212)
        expect(translator.translate).to eq('two hundred and twelve')

        translator = IntegerTranslator.new(354)
        expect(translator.translate).to eq('three hundred and fifthy four')

        translator = IntegerTranslator.new(459)
        expect(translator.translate).to eq('four hundred and fifthy nine')

        translator = IntegerTranslator.new(578)
        expect(translator.translate).to eq('five hundred and seventy eight')

        translator = IntegerTranslator.new(638)
        expect(translator.translate).to eq('six hundred and thirty eight')

        translator = IntegerTranslator.new(782)
        expect(translator.translate).to eq('seven hundred and eighty two')

        translator = IntegerTranslator.new(839)
        expect(translator.translate).to eq('eight hundred and thirty nine')

        translator = IntegerTranslator.new(918)
        expect(translator.translate).to eq('nine hundred and eighteen')
      end
    end # hunreds sampling

  end # translate
end
