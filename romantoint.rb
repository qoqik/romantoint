# Функція для перетворення римських чисел в арабські числа
def roman_to_int_value(s)
  roman_to_int = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  total = 0
  prev_value = 0
  s.upcase.reverse.each_char do |char|
    value = roman_to_int[char]
    if value.nil?
      puts "Некоректне введення. Будь ласка, введіть римське або арабське число."
      return nil
    end
    if value < prev_value
      total -= value
    else
      total += value
    end
    prev_value = value
  end
  total
end

# Функція для перетворення арабських чисел в римські числа
def int_to_roman_value(num)
  if num < 1 || num > 3999
    puts "Введіть арабське число в діапазоні від 1 до 3999."
    return nil
  end

  roman_numerals = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  result = ""
  roman_numerals.each do |value, numeral|
    while num >= value
      result += numeral
      num -= value
    end
  end
  result
end

# Зчитуємо введене число
print "Введіть римське або арабське число: "
input = gets.chomp

# Визначаємо, чи це римське чи арабське число та виводимо результат
if input.match?(/\A[MDCLXVI]+\z/)
  # Якщо введено римське число
  result = roman_to_int_value(input)
  puts "Результат: #{result}" if result
elsif input.match?(/\A\d+\z/)
  # Якщо введено арабське число
  input_num = input.to_i
  result = int_to_roman_value(input_num)
  puts "Результат: #{result}" if result
else
  puts "Некоректне введення. Будь ласка, введіть римське або арабське число."
end
