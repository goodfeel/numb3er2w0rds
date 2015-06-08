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
      
    end
    output
  end


end
