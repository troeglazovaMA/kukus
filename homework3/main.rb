
def word
  print "Пожалуйста, введите слово: "
  word = gets.chomp.force_encoding('utf-8')
  lastsymbols=(word[word.length-2] + word[word.length-1]).downcase
  if lastsymbols == "cs"
    2**(word.length)
  else
    word.reverse
  end
end

def pockemons
  print "Пожалуйста, введите количество покемонов: "
  num = gets.chomp.to_i
  pockemons_array = Array.new
  num.times do 
    print "Пожалуйста, введите имя покемона: "
    name_gets=gets.chomp
    print "Пожалуйста, введите цвет покемона: "
    color_gets = gets.chomp
    pockemon = { name: name_gets, color: color_gets}
    pockemons_array.push(pockemon)	
  end
  pockemons_array	
end

