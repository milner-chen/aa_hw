require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) { Dessert.new("brownie", 10, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "all", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to_not include("flour")
      brownie.add_ingredient("flour")
      expect(brownie.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(10)
      brownie.eat(3)
      expect(brownie.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat("all").to raise_error ("not enough left!") }
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(brownie.serve).to include(:chef.titleize(brownie.chef.name))
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(brownie).to receive(:chef).with(brownie)
      brownie.chef(brownie)
    end
  end
end
