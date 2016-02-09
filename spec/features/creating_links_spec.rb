require 'spec_helper'

feature 'create links' do

  scenario 'save a new link to the homepage' do
    visit '/'
    expect(page).to have_button 'Add new bookmark'
    add_link
    within 'ul#links' do
      expect(page).to have_content 'DataMapper'
    end
  end

end
