require 'rails_helper'

RSpec.describe 'Edit Article', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  context 'on success' do
    before(:each) { sign_in user }

    describe 'as an authenticated user' do
      scenario 'by visiting the edit page' do
        visit edit_article_path(article)
        expect(page).to have_content('Sign out')
        edit_article(article)
      end

      scenario 'by visiting home page' do
        skip
        visit articles_path
        expect(page).to have_content('Articles')
        click_link('Edit')
        edit_article(article)
      end

      scenario 'by visiting show page' do
        visit article_path(article)
        click_link('Edit')
        edit_article(article)
      end
    end
  end

  context 'on failure' do
    describe 'as an anonymous user' do
      scenario 'by visiting the edit page' do
        visit edit_article_path(article)
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end

      scenario 'by visiting home page' do
        visit articles_path
        visit edit_article_path(article)
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end

      scenario 'by visiting show page' do
        visit article_path(article)
        visit edit_article_path(article)
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end

  def edit_article(article)
    expect(page).to have_current_path(edit_article_path(article))
    expect(page).to have_field('Title')
    expect(page).to have_field('Content')
    expect(page).to have_field('article[title]', with: article.title)
    expect(page).to have_field('article[content]', with: article.content)
    within('form') do
      fill_in 'article[title]', with: 'How to edit an article with a robot'
      fill_in 'article[content]', with: 'This article is written by a robot'
    end
    click_button 'Update Article'
    expect(page).to have_content('Article successfully edited!')
    expect(page).to have_content('How to edit an article with a robot')
    expect(page).to have_content('This article is written by a robot')
  end
end
