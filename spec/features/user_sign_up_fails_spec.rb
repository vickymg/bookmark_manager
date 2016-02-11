require 'spec_helper'

feature 'user password confirmation' do
  scenario 'sign up fails if the passwords do not match' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content "Your passwords do not match, please re-enter."
    expect(current_path).to eq('/users')
  end

  def sign_up(email: 'test@testmail.com', password: 'password', password_confirmation: 'paswrd')
    visit('/sign-up')
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Create account'
  end

end
