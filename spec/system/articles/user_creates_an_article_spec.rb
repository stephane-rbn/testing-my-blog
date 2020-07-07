require 'rails_helper'

RSpec.describe 'Create Article', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  context 'on success' do
    before(:each) { sign_in user }

    describe 'as an authenticated user' do
      scenario 'by visiting the new page' do
        visit new_article_path
        expect(page).to have_content('Sign out')
        expect(page).to have_current_path(new_article_path)
        expect(page).to have_field('Title')
        expect(page).to have_field('Content')
        within('form') do
          fill_in 'article[title]', with: 'How to create an article with a robot'
          fill_in 'article[content]', with: 'This article is written by a robot'
        end
        click_button 'Create Article'
        expect(page).to have_content('New article successfully added!')
        expect(page).to have_content('How to create an article with a robot')
        expect(page).to have_content('This article is written by a robot')
        expect(page).to have_link('Home', href: '/articles')
      end

      scenario 'by visiting home page' do
        visit articles_path
        expect(page).to have_content('Articles')
        click_link('New')
        expect(page).to have_current_path(new_article_path)
        expect(page).to have_field('Title')
        expect(page).to have_field('Content')
        within('form') do
          fill_in 'article[title]', with: 'How to create an article with a robot'
          fill_in 'article[content]', with: 'This article is written by a robot'
        end
        click_button 'Create Article'
        expect(page).to have_content('New article successfully added!')
        expect(page).to have_content('How to create an article with a robot')
        expect(page).to have_content('This article is written by a robot')
        expect(page).to have_link('Home', href: '/articles')
      end

      scenario 'by visiting show page' do
        visit article_path(article)
        expect(page).to have_content(article.title)
        visit articles_path
        expect(page).to have_content('Articles')
        click_link('New')
        expect(page).to have_current_path(new_article_path)
        expect(page).to have_field('Title')
        expect(page).to have_field('Content')
        within('form') do
          fill_in 'article[title]', with: 'How to create an article with a robot'
          fill_in 'article[content]', with: 'This article is written by a robot'
        end
        click_button 'Create Article'
        expect(page).to have_content('New article successfully added!')
        expect(page).to have_content('How to create an article with a robot')
        expect(page).to have_content('This article is written by a robot')
        expect(page).to have_link('Home', href: '/articles')
      end
    end
  end

  context 'on failure' do
    describe 'as an anonymous user' do
      scenario 'by visiting the new page' do
        visit new_article_path
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end
end
