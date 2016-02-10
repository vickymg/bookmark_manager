require 'spec_helper'

feature 'Filtering through tags' do
  scenario 'Filtering through the bubbles tag' do
    visit '/link/add-new'
    fill_in 'bookmark_name', with: 'Bubble Stuff'
    fill_in 'url', with: 'www.bubblesaregreat.com'
    fill_in 'tag', with: 'bubbles'
    click_button 'create link'
    visit '/link/tag'
      fill_in 'search', with: 'bubbles'
      click_button 'search'
    expect(page).to have_content('Bubble Stuff')
  end

end
