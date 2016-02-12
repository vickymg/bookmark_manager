require 'web_helper'

feature 'user password confirmation' do
  scenario 'sign up fails if the passwords do not match' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content "Password does not match the confirmation"
    expect(current_path).to eq('/users')
  end

  feature 'must sign up with email' do
    scenario 'sign up fails if there is no email address' do
      expect { sign_up(email: nil)}.not_to change(User, :count)
    end
  end

  feature 'must sign up with valid email' do
    scenario 'sign up fails if email address incorrect' do
      expect { sign_up(email: 'testgmail.com')}.not_to change(User, :count)
    end
  end

  feature 'must sign up with unique email' do
    scenario 'sign up fails if email address already in use' do
      sign_up(email: 'test@testmail.com')
      expect { sign_up(email:'test@testmail.com')}.not_to change(User, :count)
    end

    scenario 'user sees error message' do
      sign_up(email: 'test@testmail.com')
      sign_up(email: 'test@testmail.com')
      expect(page).to have_content "Email is already taken"
    end
  end
end
