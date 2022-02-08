PATH1 = 'mytxt1.txt'
PATH2 = 'mytxt2.txt'
STUDENTS_PATH = 'students.txt'
RESULTS_PATH = 'results.txt'

def index
  f = File.open(PATH1)
  file_data = f.readlines.map(&:chomp)
  f.close
  file_data
end

def find(i)
  f = File.open(PATH1)
  file_data = f.readlines.map(&:chomp)
  if i >= file_data.length
    f.close
    "Ошибка. Введенный индекс превышает число строк файла"
  else
    f.close
    file_data[i]
  end
end

def where(pattern)
  lines = Array.new
  File.foreach(PATH1).with_index do |line, index|
    if line.include?(pattern)
      lines.push({index_of_line: index, line_text: line.chomp})
    end
  end
  lines.length >= 1 ? lines : "По заданному шаблону ничего не найдено"
end

def update(id, text)
  f = File.open(PATH2, 'w')
  File.foreach(PATH1).with_index do |line, index|
    f.puts(id == index ? text : line)
  end
  f.close
  File.write(PATH1, File.read(PATH2))
  File.delete(PATH2) if File.exist?(PATH2)
  File.read(PATH1)	
end

def delete(id)
  f = File.open(PATH2, 'w')
  File.foreach(PATH1).with_index do |line, index|
    f.puts(line) if index != id
  end
  f.close
  File.write(PATH1, File.read(PATH2))
  File.delete(PATH2) if File.exist?(PATH2)
  File.read(PATH1)
end

def students
  f = File.open(STUDENTS_PATH)
  students_data = f.readlines.map(&:chomp)
  f.close
  return "Файл не содержит студентов" if students_data.include?("Все студенты были перемещены") || students_data.length == 0
  results_data = Array.new
  age = ""
  while age != "-1" && results_data.length < students_data.length do
    print "введите возраст студента: "
    age = gets.chomp
    students_data.each_with_index do |student, index|
      if student.include?(age)
        results_data.push(student)
        students_data[index] = "moved"
      end
    end
  end
  students_data.delete("moved")
  if students_data.length == 0
    f = File.open(STUDENTS_PATH, 'w')
    f.puts("Все студенты были перемещены")
    f.close
  else
    f = File.open(STUDENTS_PATH, 'w')
    f.puts(students_data)
    f.close
  end
  f = File.open(RESULTS_PATH, 'a')
  f.puts(results_data)
  f.close
  puts results_data
  File.read(STUDENTS_PATH)
end

