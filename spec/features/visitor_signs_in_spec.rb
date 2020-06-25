require 'rails_helper'

RSpec.describe 'Sign in feature', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  it 'should be valid with valid email and password' do
    sign_in_with user.email, user.first_name, user.last_name, user.password, user.password_confirmation
    expect(page).to have_content('Sign out')
  end

  context '#email' do
    it 'should be valid with valid email' do
      sign_in_with user.email, user.first_name, user.last_name, user.password, user.password_confirmation
      expect(page).to have_content('Sign out')
    end

    # it 'should not be valid with blank email' do
    #   skip 'TODO'
    # end
    #
    # it 'should not be valid without email' do
    #   skip 'TODO'
    # end
  end

  context '#password' do
    it 'should be valid with valid password' do
      sign_in_with user.email, user.first_name, user.last_name, user.password, user.password_confirmation
      expect(page).to have_content('Sign out')
    end

    # it 'should not be valid with blank password' do
    #   skip 'TODO'
    # end
    #
    # it 'should not be valid without password' do
    #   skip 'TODO'
    # end
  end

  def sign_in_with(email, first_name, last_name, password, password_confirmation)
    visit new_user_registration_path
    within('form') do
      fill_in 'user_email', with: email
      fill_in 'user_first_name', with: first_name
      fill_in 'user_last_name', with: last_name
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
    end
    click_button 'Sign up'

    visit destroy_user_session_path

    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
    end
    click_button 'Log in'
  end
end
