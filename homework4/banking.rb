START_BALANCE = 100.00
B_PATH = 'balance.txt'
$current_balance = 100.0

def true_input(data, balance)
  return -1 if data < 0
  return 1 if data > balance
  return 0 if data >= 0 && data <= balance
end
def bancking
  if File.exist?(B_PATH)
    $current_balance = File.read(B_PATH).to_f
  else
    File.write(B_PATH, START_BALANCE)
    $current_balance = START_BALANCE
  end
  print "Доброго дня, пользователь! Вы вошли в систему. \nВаш текущий баланс: #{$current_balance} единиц."
  puts "\nВозможные операции:\n пополнение баланса (введите d);\n снятие единиц со счета (введите w);\n узнать текущий баланс (введите b);\n выход (введите q)."
  command = gets.chomp.downcase
  while command != "q" do
    case command
      when "d"
        puts "\nВы решили пополнить баланс. \nДля отмены операции введите 0 или не числовое значение. \nДля продолжения введите сумму операции:"
        deposit = gets.chomp.to_f
        if deposit < 0
          while deposit < 0 do 
            puts "\nНекорректная сумма.Невозможно пополнить на отрицательную сумму.\nПожалуйста, введите сумму депозита или отмените операцию:"
            deposit = gets.chomp.to_f
          end
        end
        if deposit == 0
          puts "\nОперация пополнения отменена\n"
        else 
          puts "\nВаш баланс пополнен на #{deposit} единиц."
          $current_balance += deposit
          File.write(B_PATH, $current_balance)
        end
      when "b"
        puts "\nВаш текущий баланс: #{$current_balance} единиц.\n"
      when "w"
        puts "\nВы решили снять с баланса единицы.\nДля отмены операции введите 0 или не числовое значение.\nДля продолжения введите сумму операции:"
        withdraw = gets.chomp.to_f
        while true_input(withdraw, $current_balance) != 0 do
          puts "\nНекорректная сумма.Невозможно снять отрицательную сумму.\nПожалуйста, введите положительную сумму или отмените операцию:" if true_input(withdraw, $current_balance) == -1
          puts "\nНевозможно снять сумму больше вашего баланса.\nВаш текущий баланс: #{$current_balance} единиц.\nВведите меньшую сумму или отмените операцию:" if true_input(withdraw, $current_balance) == 1
          withdraw = gets.chomp.to_f
        end
        if withdraw == 0
          puts "\nОперация снятия отменена\n"
        else 
          puts "\nВаш баланс уменьшен на #{withdraw} единиц.\n"
          $current_balance -= withdraw
          File.write(B_PATH, $current_balance)
        end
      else
        puts "\nНекорректная команда!\n"
    end
    puts "\nВозможные операции:\n пополнение баланса (введите d);\n снятие единиц со счета (введите w);\n узнать текущий баланс (введите b);\n выход (введите q)."
    command = gets.chomp.downcase
  end
  File.write(B_PATH, $current_balance)
  puts "До встречи, Пользователь!"
  $current_balance
end

