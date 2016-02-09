require 'spec_helper'

# As a user
# So that I can visit my favourite sites
# I want to see a list of my links

feature 'Viewing links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
      expect(page).to have_content('Makers Academy')
  end
end
