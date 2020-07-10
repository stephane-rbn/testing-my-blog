require 'rails_helper'

RSpec.describe 'Create Comment', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  context 'on success' do
    before(:each) { sign_in user }

    describe 'as an authenticated user' do
      scenario 'by visiting the show page' do
        visit article_path(article)
        expect(page).to have_content('Sign out')
        expect(page).to have_current_path(article_path(article))
        expect(page).to have_field('Content')
        within('form') do
          fill_in 'comment[content]', with: 'This comment is written by a robot'
        end
        click_button 'Create Comment'
        expect(page).to have_content('New comment successfully added!')
        expect(page).to have_content('This comment is written by a robot')
        expect(page).to have_link('Home', href: '/articles')
      end
    end
  end

  context 'on failure' do
    describe 'as an anonymous user' do
      scenario 'by visiting the show page' do
        visit article_path(article)
        expect(page).to have_content('Sign in')
        expect(page).to have_content('Wanna write a comment? Sign in or sign up now!')
      end
    end
  end
end
