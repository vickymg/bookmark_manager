require 'spec_helper'

feature 'tagging a link' do
  scenario 'The user adds a tag to a bookmark.' do
    Link.create(url: 'http://www.bookmark.com', title: 'Favorite link')
    visit '/link/add-tag'
    fill_in 'title', with: 'Favourite title'
    fill_in 'tag', with: 'Orcs!'
    click_button 'Submit'
    expect(page).to have_content('Tags: Orcs!')    
  end
end
