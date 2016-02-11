
def sign_up
  visit('/sign-up')
  fill_in 'email', with: 'test@testmail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Create account'
end

def sign_up_wrong(email: 'test@testmail.com', password: 'password', password_confirmation: 'paswrd')
  visit('/sign-up')
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Create account'
end
