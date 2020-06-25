require 'rails_helper'

RSpec.describe 'Sign in feature', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  it 'should be valid with valid email and password' do
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_content('Sign out')
  end

  context '#email' do
    it 'should not be valid with blank email' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should not be valid without email' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: nil
        fill_in 'user_password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  context '#password' do
    it 'should not be valid with blank password' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should not be valid without password' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: nil
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
