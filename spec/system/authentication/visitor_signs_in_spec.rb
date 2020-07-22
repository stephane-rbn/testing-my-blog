require 'rails_helper'

RSpec.describe 'Sign in feature', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'should be valid with valid email and password' do
    visit new_user_session_path
    sign_in_with user.email, user.password
    expect(page).to have_content('Sign out')
  end

  context '#email' do
    it 'should not be valid with blank email' do
      visit new_user_session_path
      sign_in_with '', user.password
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should not be valid without email' do
      visit new_user_session_path
      sign_in_with nil, user.password
      expect(page).to have_content('Invalid Email or password.')
    end
  end

  context '#password' do
    it 'should not be valid with blank password' do
      visit new_user_session_path
      sign_in_with user.email, ''
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'should not be valid without password' do
      visit new_user_session_path
      sign_in_with user.email, nil
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
