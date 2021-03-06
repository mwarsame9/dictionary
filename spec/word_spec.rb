require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it("returns the word entered in to the dictionary") do
      test_dictionary = Word.new("tea")
      expect(test_dictionary.word()).to(eq("tea"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_dictionary = Word.new("tea")
      expect(test_dictionary.id()).to(eq(1))
    end
  end

  describe('#definitions') do
    it("initially returns an empty array of definitions for the word") do
      test_dictionary = Word.new("tea")
      expect(test_dictionary.definitions()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_dictionary = Word.new("tea")
      test_dictionary.save()
      expect(Word.all()).to(eq([test_dictionary]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new("tea").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("tea")
      test_word.save()
      test_word2 = Word.new("coffee")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end


end
