def calculate(input)
  delimiter, parsed = parse_delimiter(input)

  numbers = parsed.split(delimiter).map(&:to_i).filter { _1 <= 1000 }

  validate!(numbers)

  numbers.inject(0, :+)
end

private 
def parse_delimiter(input)
  if input.start_with?('//[')
    capture = input.match(/\/\/\[(.*)\]\n/)

    start_from = input.index("\n") + 1
    [capture[1], input[start_from..]]
  elsif input.start_with?('//')
    capture = input.match(/\/\/(.){1}\n/)

    start_from = input.index("\n") + 1
    [capture[1], input[start_from..]]
  else 
    [/[,\n]/, input]
  end 
end

def validate!(numbers)
  invalid = numbers.filter(&:negative?)
  if invalid.any?
    raise Exception.new("negatives not allowed : #{invalid.map(&:to_s).join(', ')}") 
  end
end
