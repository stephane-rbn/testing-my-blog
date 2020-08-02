require 'rails_helper'

RSpec.describe 'Sign up', type: :system do
  let(:user) { FactoryBot.build(:user) }

  # rubocop:disable Metrics/LineLength
  it 'should be valid with valid email, first_name, last_name, password and password_confirmation' do
    sign_up_with user.email, user.first_name, user.last_name, user.password, user.password_confirmation
    # rubocop:enable Metrics/LineLength
    expect(page).to have_content('Sign out')
  end

  context '#email' do
    it 'should not be valid with blank email' do
      sign_up_with '', user.first_name, user.last_name, user.password, user.password_confirmation
      expect(page).to have_content("Email can't be blank")
    end

    it 'should not be valid without email' do
      sign_up_with nil, user.first_name, user.last_name, user.password, user.password_confirmation
      expect(page).to have_content("Email can't be blank")
    end
  end

  context '#first_name' do
    it 'should not be valid with blank first_name' do
      sign_up_with user.email, '', user.last_name, user.password, user.password_confirmation
      expect(page).to have_content("First name can't be blank")
    end

    it 'should not be valid without first_name' do
      sign_up_with user.email, nil, user.last_name, user.password, user.password_confirmation
      expect(page).to have_content("First name can't be blank")
    end
  end

  context '#last_name' do
    it 'should not be valid with blank last_name' do
      sign_up_with user.email, user.first_name, '', user.password, user.password_confirmation
      expect(page).to have_content("Last name can't be blank")
    end

    it 'should not be valid without last_name' do
      sign_up_with user.email, user.first_name, nil, user.password, user.password_confirmation
      expect(page).to have_content("Last name can't be blank")
    end
  end

  context '#password' do
    it 'should not be valid with blank password' do
      sign_up_with user.email, user.first_name, user.last_name, '', user.password_confirmation
      expect(page).to have_content("Password can't be blank")
    end

    it 'should not be valid without password' do
      sign_up_with user.email, user.first_name, user.last_name, nil, user.password_confirmation
      expect(page).to have_content("Password can't be blank")
    end
  end

  context '#password_confirmation' do
    it 'should not be valid with blank password_confirmation' do
      sign_up_with user.email, user.first_name, user.last_name, user.password, ''
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it 'should not be valid without password_confirmation' do
      sign_up_with user.email, user.first_name, user.last_name, user.password, nil
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
