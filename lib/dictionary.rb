class Dictionary
  @@words = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@words.length().+(1)
    @definitions = []
  end

  define_method(:word) do
    @word
  end

end