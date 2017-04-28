require('rspec')
require('dictionary')

describe(Dictionary) do

  describe('#word') do
    it("returns the word entered in to the dictionary") do
      test_dictionary = Dictionary.new("tea")
      expect(test_dictionary.word()).to(eq("tea"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_dictionary = Dictionary.new("tea")
      expect(test_dictionary.id()).to(eq(1))
    end
  end

  describe('#definitions') do
    it("initially returns an empty array of definitions for the word") do
      test_dictionary = Dictionary.new("tea")
      expect(test_dictionary.definitions()).to(eq([]))
    end
  end


end
