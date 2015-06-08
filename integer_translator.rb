class IntegerTranslator
  attr_reader :input, :translation
  def initialize(input)
    raise 'Sorry, only integer can be accepted' unless input.is_a?(Integer)
    @input = input
  end
end
