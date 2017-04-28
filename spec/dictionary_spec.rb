require('rspec')
require('dictionary')

describe(Dictionary) do

  describe('#word') do
    it("returns the word entered in to the dictionary") do
      test_dictionary = Dictionary.new("tea")
      expect(test_dictionary.word()).to(eq("tea"))
    end
  end
end
