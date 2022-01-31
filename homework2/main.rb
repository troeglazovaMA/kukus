
def greeting
  print "Пожалуйста, введите ваше имя: "
  name=gets.chomp
  print "Пожалуйста, введите вашу фамилию: "
  lastname=gets.chomp
  print "Пожалуйста, введите ваш возраст: "
  age=gets.chomp.to_i
  if age<18
    "Привет, #{name.force_encoding('utf-8')} #{lastname.force_encoding('utf-8')}. Тебе меньше 18 лет, но начать учиться программировать никогда не поздно!"
  else
    "Привет, #{name.force_encoding('utf-8')} #{lastname.force_encoding('utf-8')}. Самое время заняться делом!"
  end
end

=begin
  в комментарии версия метода для случая если нужно оба числа сложить, когда они равны 20
=end
def foobar(a,b)
=begin
  if a==20 and b==20 
    puts "#{b+a}"
    elsif b==20
    puts "#{a}"
  elsif a==20 
    puts "#{b}"
  else
    puts "#{b+a}"
  end
=end
  if b==20
    a
  elsif a==20 
    b
  else
    b+a
  end
end 

