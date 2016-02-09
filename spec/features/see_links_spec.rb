require 'spec_helper'

feature 'display list of bookmark links' do

  scenario 'display bookmark links on homepage' do
    visit '/'
    Link.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    within 'ul#links' do
      expect(page).to have_content 'http://www.makersacademy.com/'
    end
  end

end
