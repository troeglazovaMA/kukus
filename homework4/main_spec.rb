require 'rspec'
require './main.rb'

RSpec.describe "Main methods " do
  let (:string) do
    <<-STRING
123
23
13
some line
example line
not line
new text3
line3
line not founded
    STRING
  end
  
  let (:exp_up) do
    <<-STRING
123
23
32
some line
example line
not line
new text3
line3
line not founded
    STRING
  end
  
  let (:exp_del) do
    <<-STRING
123
23
some line
example line
not line
new text3
line3
line not founded
    STRING
  end
  let (:studs) do
    <<-STRING
Иванов Иван 10
Петров Петр 15
Симушкин Симон 16
Савушкин Савелий 17
Демидов Демид 10
Анненко Анна 15
Симоненко Симона 10
Страдивари Страдивариус 18
Скрипченко Скрипник 19
Звезденко Звездочка 20
    STRING
  end
  
  let (:studs_res) do
    <<-STRING
Иванов Иван 10
Симушкин Симон 16
Савушкин Савелий 17
Демидов Демид 10
Симоненко Симона 10
Страдивари Страдивариус 18
Скрипченко Скрипник 19
Звезденко Звездочка 20
    STRING
  end

  before {
    File.write(PATH1, string)  
    File.write(STUDENTS_PATH, studs)}

  it "index method" do
    expekto = string.split("\n")
    expect(index).to eq(expekto)
  end
  
  it "find error" do
    expect(find(20)).to eq("Ошибка. Введенный индекс превышает число строк файла")
  end
  
  it "find true" do
    expect(find(2)).to eq("13")
  end
  
  it "where method" do
    res=[{:index_of_line => 0, :line_text => "123"}, {:index_of_line => 1, :line_text => "23"}, {:index_of_line => 2, :line_text => "13"}, 
         {:index_of_line => 6, :line_text => "new text3"}, {:index_of_line => 7, :line_text => "line3"}]
    expect(where("3")).to eq(res)
  end
  
  it "update method" do
    expect(update(2,"32")).to eq(exp_up)
  end
  
  it "delete method" do
    expect(delete(2)).to eq(exp_del)
  end
  
  it "students method" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("15", "-1")
    expect(students).to eq(studs_res)
  end
  
end
