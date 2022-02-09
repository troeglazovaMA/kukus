require 'rspec'
require './banking.rb'

RSpec.describe "Main methods " do

  it "bancomatik" do
    balance = File.read(B_PATH).to_i
    com1 = "B\n"
    com2 = "d\n"
    com3 = "w\n"
    com4 = "q\n"
    comstr = "vbfh"
    sum1 = "50\n"
    sum2 = "-50\n"
    sum3 = "500\n"
    #balance,deposit,cancel,deposit,-50,50,withdraw,-50,500,50,exit
    #if we did it commands,balance in file will be unmodified
    allow_any_instance_of(Kernel).to receive(:gets).and_return(com1,com2,comstr,com2,sum2,sum1,com3,sum2,sum3,sum1,com4)
    expect(bancking).to eq(balance)
  end
  
  it "dop metod proverki pravilnogo vvoda < 0" do
    expect(true_input(-50, 100)).to eq(-1)
  end
  
   it "dop metod proverki pravilnogo vvoda < balance" do
    expect(true_input(550, 100)).to eq(1)
  end
  
   it "dop metod proverki pravilnogo vvoda all good" do
    expect(true_input(50, 100)).to eq(0)
  end
end
