# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

require 'spec_helper'

feature 'View Link' do

  scenario 'go to homepage and see a list of links' do
    Links.create(url: 'http://www.bookmark.com', title: 'Favorite link')

    visit '/link'
    expect(page.status_code).to eq 200

    within 'links' do
      expect(page).to have_content('Favorite link')
    end
  end

end
