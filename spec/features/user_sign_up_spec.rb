require 'spec_helper'

feature 'sign-up' do
  scenario 'user adds an account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, test@testmail.com!"
    expect(User.first.email).to eq('test@testmail.com')
  end
end
