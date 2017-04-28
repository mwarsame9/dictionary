require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  erb(:index)
end

get('/words/new') do
   erb(:words_form)
end

get('/words') do
  @words = Dictionary.all()
  erb(:word_definitions_form)
end

get('/wordshome') do
  @words = Dictionary.all()
  erb(:words)
end

post('/words') do
  meaning = params.fetch('meaning')
  @word = Dictionary.new(meaning)
  @word.save
  @words = Dictionary.all()
  erb(:word_definitions_form)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id') do
  @word = Dictionary.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
    @word = Dictionary.find(params.fetch('id').to_i())
    erb(:word_definitions_form)
end
get('/definitions') do
  @definitions = Definition.all()
  erb(:definitions)
end

get('/definitions/new') do
  erb(:definitions_form)
end

post('/definitions') do
  meaning = params.fetch('meaning')
  @definition = Definition.new(meaning)
  @definition.save()
  @word = Dictionary.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:confirmation)
end
