require "../spec_helper"

describe Monads::Try do
  describe "#to_maybe" do
    it "Monads::Try(Int32).new(-> { 5 }).to_maybe is Just" do
      value = Monads::Try(Int32).new(-> { 5 }).to_maybe
      value.should eq(Monads::Just.new(5))
    end

    it "Monads::Try(Int32).new(-> { 5 / 0 }).to_maybe is Nothing" do
      value = Monads::Try(Int32).new(-> { 5 / 0 }).to_maybe
      value.should eq(Monads::Nothing(Int32).new)
    end
  end

  describe "#to_either" do
    it "Monads::Try(Int32).new(-> { 5 }).to_either is Right" do
      value = Monads::Try(Int32).new(-> { 5 }).to_either
      value.should eq(Monads::Right.new(5))
    end

    it "Monads::Try(Int32).new(-> { 5 / 0 }).to_either is Left" do
      value = Monads::Try(Int32).new(-> { 5 / 0 }).to_either
      value.should eq(Monads::LeftException.new(DivisionByZeroError.new))
    end
  end
end
