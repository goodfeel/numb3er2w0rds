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
      k_ten = ((input % 100) / 10)
      right_most = input % 10

      output = output + NUMBERS[k_ten * 10 + right_most] if k_ten < 2
      output += TENS[k_ten] if k_ten > 1
      output += NUMBERS[right_most] if k_ten >= 2 && right_most != 0
    end
    output
  end


end
