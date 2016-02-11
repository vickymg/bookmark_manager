require 'spec_helper'

feature 'sign-up' do
  scenario 'user adds an account' do
    visit('/')
    fill_in 'username', with: 'test@testmail.com'
    fill_in 'password', with: 'password'
    click_button 'Create account'
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, testmctester!"
    expect(User.first.email).to eq('test@testmail.com')
  end
end
