require 'spec_helper'

feature 'creating links' do
  scenario 'user adds links and they are stored' do
    visit'/link/add-new'
    # click_button'add link'
    fill_in 'title', with: 'Bookmark Title'
    fill_in 'URL', with: 'www.url.co.uk'
    click_button'create link'
    expect(current_path).to eq '/link'

    within 'ul#link' do
      expect(page).to have_content ('Bookmark Title')
    end
  end
end
