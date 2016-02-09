require 'spec_helper'

# As a user
# So I can add favourite websites to the list
# I want to add new links

feature 'Adding links' do
  scenario 'I can add a new link' do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'www.bbc.co.uk'
    click_button 'Create link'
    expect(page).to have_content('BBC')
  end
end
