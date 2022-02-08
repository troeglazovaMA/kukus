require 'rspec'
require './main.rb'

RSpec.describe "Main methods " do

  it "3 pockemons" do
    my_pockemons = [{name: "Pickachu1", color: "Yellow"}, {name: "Pickachu2", color: "Yellow"}, {name: "Pickachu3", color: "Yellow"}]
    allow_any_instance_of(Kernel).to receive(:gets).and_return("3","Pickachu1","Yellow","Pickachu2","Yellow","Pickachu3","Yellow")
    expect(pockemons).to eq(my_pockemons)
  end

  it "word with cs in end" do
    my_word = "cscs"
    allow_any_instance_of(Kernel).to receive(:gets).and_return(my_word)
    expect(word).to eq(16)
  end

  it "word to reverse" do
    my_word = "csoop"
    allow_any_instance_of(Kernel).to receive(:gets).and_return(my_word)
    expect(word).to eq("poosc")
  end
  
end
