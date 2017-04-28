require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('paths for word', {:type => :feature}) do
  it('adds a word') do
    visit('/words/new')
    fill_in('meaning', :with => 'tea')
    click_button('Add Word')
    expect(page).to have_content('Add')
  end
end
