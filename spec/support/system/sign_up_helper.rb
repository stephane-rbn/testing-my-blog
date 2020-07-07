module SignUpHelper
  def sign_up_with(email, first_name, last_name, password, password_confirmation)
    visit new_user_registration_path
    within('form') do
      fill_in 'user_email', with: email
      fill_in 'user_first_name', with: first_name
      fill_in 'user_last_name', with: last_name
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
    end
    click_button 'Sign up'
  end
end

RSpec.configure do |config|
  config.include SignUpHelper, type: :system
end
