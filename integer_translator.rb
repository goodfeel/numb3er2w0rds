class IntegerTranslator
  attr_reader :input, :translation

  THOUSANDS = ['thousand', 'million', 'billion', 'trillion', 'quadrillion']

  NUMBERS = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
             'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',
             'eighteen', 'nineteen']

  TENS = ['', 'ten', 'twenty', 'thirty', 'fourty', 'fifthy', 'sixty', 'seventy', 'eighty', 'ninety']

  def initialize(input)
    raise 'Sorry, only integer can be accepted' unless input.is_a?(Integer)
    @input = input
  end

  def translate
    output = ''

    # Negated
    if @input < 0
      output += 'Negative '
      @input = @input.abs
    end
    if @input.zero?
      # Special case
      output = 'zero'
    else

      output += small_translate(input)
    end
    output
  end

  def small_translate(input)
    output = ''
    k_hundred = ((input%1000) / 100)
    k_ten = ((input % 100) / 10)
    right_most = input % 10

    output += NUMBERS[k_hundred] + ' hundred' if k_hundred != 0
    output += ' and ' if k_hundred != 0 && (k_ten != 0 || right_most != 0)
    output = output + NUMBERS[k_ten * 10 + right_most] if k_ten < 2
    output += TENS[k_ten] if k_ten > 1
    output += ' ' +NUMBERS[right_most] if k_ten >= 2 && right_most != 0

    output
  end


end
