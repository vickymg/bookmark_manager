require 'spec_helper'

feature 'create links' do

  scenario 'save a new link to the homepage' do
    visit '/'
    expect(page).to have_button 'Add new bookmark'
    fill_in "Title", with: 'DataMapper'
    fill_in "URL", with: 'http://datamapper.org/'
    click_button 'Add new bookmark'
    within 'ul#links' do
      expect(page).to have_content 'DataMapper'
    end
  end

end
