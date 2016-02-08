require 'spec_helper'

  feature 'list of URLS on homepage' do

    scenario 'going onto homepage' do
      visit '/'
      expect(page).to have_content 'Your favourites:'
    end
  end
