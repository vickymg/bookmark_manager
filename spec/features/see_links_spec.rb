require 'spec_helper'

feature 'display list of bookmark links' do

  scenario 'display bookmark links on homepage' do
    visit '/'
    expect(page).to have_content 'http://www.makersacademy.com/'
  end

end
