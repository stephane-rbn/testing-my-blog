require 'rails_helper'

RSpec.describe 'Create Article', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  context 'on success' do
    describe 'as an authenticated user' do
      before(:each) { sign_in user }

      scenario 'by visiting home page' do
        skip
        visit articles_path
        expect(page).to have_content('Articles')
        click_link('Delete')
        expect(page).to have_content('Article successfully deleted!')
      end

      scenario 'by visiting show page' do
        visit article_path(article)
        expect(page).to have_content(article.title)
        click_link('Delete')
        expect(page).to have_content('Article successfully deleted!')
      end
    end
  end

  context 'on failure' do
    describe 'as an anonymous user' do
      scenario 'by visiting the show page' do
        visit article_path(article)
        expect(page).to have_content(article.title)
        visit edit_article_path(article)
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end
end
