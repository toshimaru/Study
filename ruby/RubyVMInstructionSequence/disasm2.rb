# Ruby hoisting sample
code = <<~STR
if false 
  x = 10
end
p x
STR
eval code
# => x is nil

puts RubyVM::InstructionSequence.compile(code).disasm
