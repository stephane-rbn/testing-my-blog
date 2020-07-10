require 'rails_helper'

RSpec.describe 'Create Article', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  before { @comment = FactoryBot.create(:comment, article: article, user: user) }

  context 'on success' do
    describe 'as an authenticated user' do
      before(:each) { sign_in user }

      scenario 'by visiting the show page' do
        visit article_path(article)
        expect(page).to have_content('Sign out')
        expect(page).to have_current_path(article_path(article))
        click_link 'Delete comment'
        expect(page).to have_content('Comment successfully deleted!')
      end
    end
  end

  context 'on failure' do
    describe 'as an anonymous user' do
      scenario 'by visiting the show page' do
        visit article_path(article)
        expect(page).to have_content('Sign in')
        expect(page).to have_current_path(article_path(article))
        expect(page).to have_content(@comment.content)
        expect(page).to have_content('Wanna write a comment? Sign in or sign up now!')
      end
    end

    describe 'as an authenticated user but not author' do
      let(:other_user) { FactoryBot.create(:user) }

      scenario 'by visiting the show page' do
        skip
      end
    end
  end
end
