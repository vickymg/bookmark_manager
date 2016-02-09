require 'spec_helper'

  feature 'list of URLS on homepage' do

    scenario 'can see existing links on homepage' do
      Link.create(url: 'http:www.makersacademy.com',title: 'Makers Academy')
      visit '/links'
      expect(page).to have_content 'Your favourites:'
      within 'ul#links' do
        expect(page).to have_content('Makers Academy')
      end
    end
  end
