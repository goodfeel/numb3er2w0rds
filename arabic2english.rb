require './integer_translator'
input = ARGV[0].to_i
int_trans = IntegerTranslator.new(input)
p int_trans.translate
