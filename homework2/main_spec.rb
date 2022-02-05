require 'rspec'
require './main.rb'

RSpec.describe "Main methods " do

  it "greetings for young" do
    name="John"
    lastname="Smith"
    age="10"
    allow_any_instance_of(Kernel).to receive(:gets).and_return(name,lastname,age)
    expect(greeting).to eq("Привет, John Smith. Тебе меньше 18 лет, но начать учиться программировать никогда не поздно!")
  end

  it "greetings for adult" do
    name="Joahn"
    lastname="Smith"
    age="19"
    allow_any_instance_of(Kernel).to receive(:gets).and_return(name,lastname,age)
    expect(greeting).to eq("Привет, Joahn Smith. Самое время заняться делом!")
  end

  it "foobar for first equals 20" do
    expect(foobar(20,2)).to eq(2)
  end

  it "foobar for second equals 20" do
    expect(foobar(48,20)).to eq(48)
  end

  it "foobar for nothing equals 20" do
    expect(foobar(28,22)).to eq(50)
  end

  it "foobar for all equals 20" do
    expect(foobar(20,20)).to eq(20)
  end 
end
