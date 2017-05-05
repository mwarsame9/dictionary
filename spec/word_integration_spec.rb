require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('paths for new word', {:type => :feature}) do
  it('adds a word') do
    visit('/')
    click_link("Add New Word")
    fill_in('Word', :with => 'tea')
    click_button('Add Word')
    expect(page).to have_content('Add a definition')
  end
end

describe("the add another definition path", {:type => :feature}) do
  it("adds a new definition for a word") do
    visit("/words/1")
    click_link("Add a new definition")
    fill_in("Definition:", :with => "a greeting")
    click_button("Add Definition")
    expect(page).to(have_content('Confirmation'))
  end
end

describe("path for word list", {:type => :feature}) do
  it("shows word list") do
    visit("/")
    click_link("See Word List")
    expect(page).to(have_content('Add New Word'))
  end
end

describe('paths for homepage from specific word', {:type => :feature}) do
  it('lists definitions') do
    visit('/words/1')
    click_link('Return to Main Page')
    expect(page).to have_content('Your Dictionary')
  end
end
