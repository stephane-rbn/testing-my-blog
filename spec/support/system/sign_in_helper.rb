module SignInHelper
  def sign_in_with(email, password)
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
    end
    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include SignInHelper, type: :system
end
