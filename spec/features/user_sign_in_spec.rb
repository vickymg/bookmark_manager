require 'spec_helper'

feature 'sign_in' do
  scenario 'user can sign-in' do
    sign_up
    visit('users/sign_in')
    fill_in 'email', with: 'test@testmail.com'
    fill_in 'password', with: 'password'
    click_button 'Sign-in'
    expect(current_path).to eq('/link')
  end
end
